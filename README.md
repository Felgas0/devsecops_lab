# 🛡️ devsecops_lab 
### *Automated Security Pipeline & Zero-Trust Workflow*

[![Security Scan](https://img.shields.io/badge/Security-Snyk-blueviolet?style=for-the-badge&logo=snyk)](https://snyk.io/)
[![CI/CD](https://img.shields.io/badge/Pipeline-GitHub%20Actions-blue?style=for-the-badge&logo=githubactions)](https://github.com/features/actions)
[![SBOM](https://img.shields.io/badge/SBOM-CycloneDX-orange?style=for-the-badge)](https://cyclonedx.org/)

---

## 🚀 Overview
A production-grade CI/CD pipeline demonstrating **"Shift-Left" security principles**. This project integrates automated security scanning at every layer of the application stack using GitHub Actions and Snyk.

This repository serves as a laboratory for implementing a **zero-trust development workflow**. Every push and pull request is subjected to a battery of automated security tests covering application code, dependencies, container images, and infrastructure configurations.

---

## 📂 Repository Structure

```
.
├── .github/workflows/
│   └── security.yml    # The "Engine": contains all 5 security jobs
├── terraform/
│   └── main.tf         # IaC Lab: intentional misconfigurations
├── app.js              # SAST Lab: intentional code flaws
├── package.json        # SCA Lab: vulnerable dependencies
└── Dockerfile          # Container Lab: base image security testing
```

---

## 🛠️ The Security Stack

| Layer | Component | Tooling |
| :--- | :--- | :--- |
| **Orchestration** | CI/CD Engine | **GitHub Actions** |
| **SCA** | Composition Analysis | **Snyk Open Source** |
| **SAST** | Static Analysis | **Snyk Code** |
| **Container** | Image Scanning | **Snyk Container** |
| **IaC** | Infrastructure Audit | **Snyk IaC** |
| **Reporting** | Vulnerability Feed | **GitHub Security (SARIF)** |
| **Transparency** | Inventory | **CycloneDX SBOM** |

---

## 🏁 Project Milestones

### 1. Unified Security Dashboard (SARIF)
Instead of buried text logs, all vulnerabilities are exported in **SARIF format** and uploaded to the GitHub Security Tab. This provides a single pane of glass for monitoring:
* **Code:** Hardcoded secrets and injection flaws.
* **Deps:** Vulnerable third-party libraries.
* **Infra:** Misconfigured S3 buckets and IAM roles.

### 2. Infrastructure as Code (IaC) Scanning
We don't just secure the app; we secure the house it lives in. The `terraform/` directory is scanned for misconfigurations before the cloud environment is even provisioned.

### 3. The "Gatekeeper" (Automated Gating)
A custom Gatekeeper Job acts as the final authority on pull requests.
> **The Logic:** Scans run in parallel. If any scan detects a vulnerability, the Gatekeeper exits with a failure code.
> 
> **Merge Protection:** GitHub Branch Protection is configured to require a green "Gatekeeper" status, physically blocking insecure code from entering `main`.

### 4. TODO Software Bill of Materials (SBOM)
For every successful run, the pipeline generates a **CycloneDX SBOM**. This provides full supply-chain transparency by listing every single ingredient (dependency) used in the build.

---

## 🛠️ Installation & Setup
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/youruser/devsecops_lab.git](https://github.com/youruser/devsecops_lab.git)

2. **Configure Snyk:**
   
   Add your SNYK_TOKEN to your GitHub Repository Secrets.

3. **Run the Pipeline:**
   
   Push a commit to trigger the automated security suite.

---

## 🔒Responsible Disclosure

This repository contains deliberately vulnerable code for educational purposes. Do not use this code in a production environment.
