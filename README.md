# Containerized Application Infrastructure & Deployment Pipeline

A robust infrastructure automation and CI/CD project designed to containerize, host, and deploy a web application. This project automates the deployment lifecycle using a programmatic pipeline, orchestrates infrastructure provisioning via Infrastructure as Code (IaC), and ensures a highly available and repeatable runtime environment.

## 🚀 Key Features

* **Programmatic CI/CD Pipelines:** Automated multi-stage build, compilation, and system update workflows handled seamlessly through a Groovy-based `Jenkinsfile`.
* **Infrastructure as Code (IaC):** Modular infrastructure provisioning (such as networking, security groups, and compute instances) declaratively managed via Terraform (`main.tf`).
* **Containerized Deployment:** High-efficiency multi-stage builds engineered using a custom `Dockerfile` to create lightweight, immutable application layers.

## 🛠️ Tech Stack & Architecture

* **Automation & CI/CD:** Jenkins, GitHub Actions
* **Infrastructure as Code:** Terraform
* **Containerization:** Docker
* **Languages & Scripting:** Groovy (Jenkinsfile), JavaScript, HTML, CSS

---

## 📂 Project Structure

```text
├── .gitignore                      # Global version control exclusions
├── Dockerfile                      # Optimized layer-by-layer container build definitions
├── Jenkinsfile                     # Programmatic Groovy script for multi-stage automation
├── Prakhar_Vikram_singh_Photo.jpg  # Profile asset
├── index.html                      # Core application interface layer
├── main.tf                         # Terraform configuration for target cloud infrastructure
├── script.js                       # Logic and application control scripts
└── style.css                       # Application layout and structural styling rules
