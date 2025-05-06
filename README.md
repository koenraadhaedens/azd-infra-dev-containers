

# Azure Dev Containers Infrastructure

This repository provides an automated way to deploy a development environment inside a container, accessible as a web-based VS Code instance. The container includes all essential dependencies like Python, Node.js, and .NET, making it a ready-to-use development workspace.

This deployment will take approximately 3 minutes. If you notice anything not working or have an idea, please report an issue here on GitHub.

The deployment will collect some basic statistics. If you do not want this, please comment out the relevant lines in the post-provisioning scripts.

## 🚀 Quick Start

To install and deploy your own web-based VS Code instance, follow these steps:

### 1️⃣ Open Azure Cloud Shell
Ensure you have access to an Azure subscription and launch the Azure Cloud Shell.

### 2️⃣ Clone the Repository
Run the following command to pull the repository:
```sh
git clone https://github.com/koenraadhaedens/azd-infra-dev-containers.git
cd azd-infra-dev-containers
```

### 3️⃣ Deploy the Container
Execute the following command to set up the environment:
```sh
azd up
```
This process takes approximately **2 minutes**, after which your own web-based VS Code instance will be ready.

## 🔑 Accessing VS Code

1. Once the deployment is complete, a **URL** will be provided in the output.
2. Open the URL in your browser.
3. Click **Advanced** and proceed despite the SSL warning. This happens because an IP address is used instead of a fully qualified domain name (FQDN).
4. Use the password you set during the installation to log in.

## 📌 Features
✅ Web-based VS Code instance  
✅ Pre-installed dependencies: Python, Node.js, .NET  
✅ Quick deployment using `azd`  
✅ Secure access with password authentication  

## 🛠 Requirements If you use Cloud Shell
- An active **Azure subscription**
- Access to **Azure Cloud Shell**
## 🛠 Requirements If you use Local pc
- **Git** 
- **Azure Developer CLI (azd)** installed

## 📖 More Information
For additional details, refer to the repository documentation or raise an issue if you encounter any problems.

---

💡 **Tip:** Bookmark the provided URL for quick access to your development environment!
