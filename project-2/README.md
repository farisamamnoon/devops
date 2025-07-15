# 🚀 Azure Microservices Deployment with Azure DevOps and Argo CD

This repository contains a multi-microservice voting application built with containerized components (vote, result, worker), each with independent Dockerfiles, demonstrating a complete Azure cloud CI/CD pipeline from GitHub to Azure Repos, using Azure Pipelines for builds, Azure Container Registry for image storage, Azure Kubernetes Service for deployment, and Argo CD for GitOps-based continuous delivery.

---

## 📋 Prerequisites

Before you begin, ensure you have the following:

* **Azure Account:** With an active subscription.
* **Azure DevOps Organization:** With a project created.
* **`az` CLI:** Installed locally for Azure resource management.
* **`kubectl`:** Installed locally for Kubernetes cluster management.
* **Docker:** Installed on your CI agent VM.

---

## 🗺️ Architecture Overview

The deployment architecture involves:

* **Azure Container Registry (ACR):** To store Docker images.
* **Azure DevOps:** For Continuous Integration (CI) to build and push Docker images.
* **Self-Hosted Azure DevOps Agent:** A dedicated VM for building images, ensuring consistent build environments.
* **Azure Kubernetes Service (AKS):** The runtime environment for the microservices.
* **Argo CD:** For Continuous Delivery (CD) to synchronize Kubernetes manifests with the AKS cluster.

---

## 🛠️ Setup and Deployment Steps

Follow these steps to set up your CI/CD pipelines and deploy the application.

### 1. Azure Resource Provisioning

#### 1.1 Create Azure Resource Group

First, create a resource group to logically group all your Azure resources.

```bash
az group create --name <your-resource-group-name> --location <your-preferred-azure-region>
```

#### 1.2 Create Azure Container Registry 

```bash
az acr create --resource-group <your-resource-group-name> --name <your-acr-name> --sku Basic
```


### 2. Azure Devops Setup

#### 2.1 Import GitHub repository

* Import the example voting app repository into your Azure DevOps project.
* Navigate to your Azure DevOps project.
* Go to Repos > Files.
* Click "Import repository" (or "Initialize" if it's a new repo, then "Import").
* Paste the clone URL: https://github.com/dockersamples/example-voting-app.git

#### 2.2 Create Self-Hosted Azure DevOps Agent

##### 2.2.1 Create an Agent Pool

* In Azure DevOps, go to Project settings > Agent pools.
* Click "Add pool".
* Give it a pool.name (e.g., MyCustomAgentPool).
* Select "Self-hosted".
* Click "Create".

##### 2.2.2 Create an Azure agent for the pool

* Create a Linux VM (e.g., Ubuntu) in Azure. Ensure it has enough resources for Docker builds.
* Crucially, ensure the VM's CPU architecture matches the architecture you intend to deploy to AKS. For example, if your AKS node pool will be `amd64`, your agent VM should also be `amd64`.

##### 2.2.3 Configure the VM as an Agent 

* In Azure DevOps, go back to Agent pools > MyCustomAgentPool.
* Click "New agent".
* Follow the on-screen instructions to download, configure, and run the agent software on your newly created VM
* During config.sh, provide your Azure DevOps URL, PAT (Personal Access Token) for authentication, and the pool.name you created.

##### 2.2.4 Install Docker on the Agent VM

```bash
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker <your_vm_user>
```

> After adding your user to the docker group, log out and log back in to the VM for the changes to take effect.

#### 2.3 Create Azure DevOps Pipelines (CI)

You'll create a separate build pipeline for each microservice. This enables independent deployments.

##### 2.3.1 Create a New Pipeline

* In Azure DevOps, go to Pipelines > Pipelines.
* Click "New pipeline".
* Select "Azure Repos Git" and choose your imported repository.
* Select "Docker" as the template (Docker build and push an image to Azure Container Registry).
* Configure the connection to your Azure subscription and ACR.

##### 2.3.2 Edit the YAML

```yaml
trigger:
  paths:
    include:
    - vote/* 
```

```yaml
pool:
  name: MyCustomAgentPool # The name of your self-hosted agent pool
```
> These changes are to be made to the every pipelines..

We are creating 3 stages for every pipelines. Build, Push and Update manifest.
* Build stage can be setup by using the settings button and using build command.
* Push stage can be similarly setup with the push command.
* Update stage must be set to ShellScript@2 and point to the script in the repo. The script update-manifests takes 3 arguments.
  * The deployment manifest name. eg: **vote** if you are updating vote-depoloyment.yaml
  * Image repository name. Since we are using a template the variable is already there. eg: **$(imageRepository)**
  * Tag name. The variable for this is also in the template. eg: **$(tag)**

##### 2.3.3 Edit the shell script as is in the script

### 3. Azure Kubernetes Service (AKS) Setup

#### 3.1 Create AKS Cluster

* Do all the things that is in the create aks page. Just make note of these below
* Make sure the public IP is checked for the node pool configuration...**VERY IMPORTANT**
* Make sure the you use worker nodes of the same architecture.

