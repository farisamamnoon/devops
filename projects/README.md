# 🔧 Ansible Nginx Setup Project

A simple DevOps project using **Ansible** to configure remote servers by installing and starting **Nginx** on them. This demonstrates basic Ansible automation using EC2 instances and passwordless SSH authentication.

---

## 📌 Project Goal

- Set up an Ansible **control node** (server) and a **client node** (target server).
- Use Ansible to remotely install and start the **Nginx web server** on the client.
- Execute tasks on **one or more target servers** using Ansible playbooks.

---

## 🚀 Steps to Reproduce

### 1️⃣ Launch EC2 Instances

- Create two EC2 instances (Ubuntu preferred).
  - One will act as the **Ansible control node**.
  - The other(s) will be the **target nodes**.

### 2️⃣ Setup password-less SSH authentication

📌 Passwordless SSH is required for Ansible to connect to remote hosts without manual intervention.
- On both the instances type the below command to create a public-private key with rsa encryption
  ```
  sudo ssh-keygen -t rsa
  ``` 
  - This will create a secret folder (starts with a dot) which contains a public and a private key and list of autherized keys.
  - You should copy the public key from the control node (ends with a .pub) and paste it inside the autherized_keys file of the target node.

### 3️⃣ Now install ansible on the control node

- Use your package manager to install ansible on the control server.
📌 Note that you dont need any dependencies installed on your target nodes because ansible uses a push based mechanism where the control node pushes the configuration instead of the target nodes pulling it from the central server (like other tools like puppet and chef)
 ```
 sudo apt install ansible
 ``` 

### 4️⃣ Clone this repo and cd to it

- Clone this repository from Github to your control node. You must have git installed in it. AWS provides EC2 services with ubuntu with git pre-installed. You would have to check if you have git and install it if necessary.
 ```
 sudo apt install git
 ```
 ```
 git clone https://www.github.com/farisamamnoon/DevOps
 ```
