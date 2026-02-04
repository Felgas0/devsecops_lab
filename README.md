# devsecops_lab

🛡️ DevSecOps Lab: Automated Security Pipeline

A production-grade CI/CD pipeline demonstrating "Shift-Left" security principles. This project integrates automated security scanning at every layer of the application stack using GitHub Actions and Snyk.
🚀 Overview

This repository serves as a laboratory for implementing a zero-trust development workflow. Every push and pull request is subjected to a battery of automated security tests that cover application code, dependencies, container images, and infrastructure configurations.
🛠️ The Security Stack

    Orchestration: GitHub Actions

    SCA (Software Composition Analysis): Snyk Open Source

    SAST (Static Application Security Testing): Snyk Code

    Container Security: Snyk Container

    IaC (Infrastructure as Code) Scanning: Snyk IaC

    Reporting: GitHub Security (SARIF)

    Transparency: CycloneDX SBOM

🏁 Project Milestones
1. Unified Security Dashboard (SARIF)

Instead of buried text logs, all vulnerabilities are exported in SARIF format and uploaded to the GitHub Security Tab. This provides a single pane of glass for monitoring:

    Code: Hardcoded secrets and injection flaws.

    Deps: Vulnerable third-party libraries.

    Infra: Misconfigured S3 buckets and IAM roles.

2. Infrastructure as Code (IaC) Scanning

We don't just secure the app; we secure the house it lives in. The terraform/ directory is scanned for misconfigurations before the cloud environment is even provisioned.
3. The "Gatekeeper" (Automated Gating)

A custom Gatekeeper Job acts as the final authority on pull requests.

    The Logic: Scans run in parallel. If any scan detects a vulnerability, the Gatekeeper exits with a failure code.

    Merge Protection: GitHub Branch Protection is configured to require a green "Gatekeeper" status, physically blocking insecure code from entering main.

4. Software Bill of Materials (SBOM)

For every successful run, the pipeline generates a CycloneDX SBOM. This provides full supply-chain transparency by listing every single ingredient (dependency) used in the build.