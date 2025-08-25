# DevOps Engineering Portfolio

[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com)
[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white)](https://www.jenkins.io/)

A hands-on collection of projects demonstrating end-to-end implementation of DevOps methodologies, from code commit to production deployment.

## Overview

This repository serves as a living record of my DevOps journey. Each project is a self-contained environment that highlights my skills in:

- **Cloud Provisioning** (AWS, Azure)
- **Infrastructure as Code** (Terraform)
- **CI/CD Automation** (Jenkins, GitHub Actions)
- **Containerization & Orchestration** (Docker, Kubernetes)
- **Configuration Management** (Ansible)

## Project List

Explore the individual project folders for details, diagrams, and code.

### 🚀 [Project 1: AWS EKS & Kubernetes Deployment with IRSA](project1/)
Deployed a cloud-native application on **AWS EKS**, implementing core Kubernetes resources (Pods, Deployments, Services). Key achievements:
- Configured **Ingress with ALB Ingress Controller** for external access.
- Implemented **IRSA (IAM Roles for Service Accounts)** for secure, granular AWS resource access.
- Utilized **Fargate Profiles** for serverless worker nodes to reduce operational overhead.
- Managed the stack using **eksctl, kubectl, Helm, and AWS CLI**.
- **Goal:** To build a scalable, secure, and production-ready Kubernetes environment on AWS.

### 🚀 [Project 2: Azure CI/CD for Microservices with AKS & ArgoCD](project2/)
Built a complete **CI/CD pipeline on Azure** for a multi-service voting application. Key achievements:
- Containerized multiple microservices (**vote, result, worker**) with custom Dockerfiles.
- Automated builds and releases using **Azure Pipelines**.
- Stored container images in **Azure Container Registry (ACR)**.
- Deployed to a managed Kubernetes cluster on **Azure Kubernetes Service (AKS)**.
- Implemented **GitOps practices** using **ArgoCD** for continuous deployment and synchronization.
- **Goal:** To demonstrate end-to-end automation from code commit to production deployment on Azure.

---
