# Multi-Node Infrastructure Automated Provisioner

A fully automated, local Infrastructure-as-Code (IaC) sandbox that dynamically provisions a 2-tier web application stack. Built on Linux (Ubuntu ARM architecture), orchestrated via Vagrant, and configured using modular, production-hardened Bash provisioning scripts.

## System Architecture
The infrastructure mimics a real-world production tier separation by splitting resources into isolated roles across a private virtual network:

*   **Web Node (Nginx Reverse Proxy):** Serves as the public-facing gateway (`192.168.56.10`). It routes external traffic to internal services and handles ingress security.
*   **Database Node (MariaDB Server):** Hosted on an isolated backend network link (`192.168.56.11`). Configured securely to reject external internet access and exclusively accept internal traffic from the Web Node.

## Core DevOps Principles Demonstrated
*   **Infrastructure as Code (IaC):** Eliminated manual server creation by defining hardware properties (VCPUs, RAM allocations, port forwarding) directly in a declarative `Vagrantfile`.
*   **Fail-Fast Shell Engineering:** Utilized strict Bash error-handling mechanisms (`set -e`) within provisioning scripts to instantly halt executions upon script anomalies, ensuring broken states never reach production.
*   **Idempotency & State Validation:** Implemented structural checks (such as verifying user existence prior to execution) to allow the setup scripts to be run repeatedly without breaking existing system structures.
*   **System Hardening & Security:** Employed the **Principle of Least Privilege** by spinning up isolated non-root system users, locking down configurations, and automating stateful firewall policies via `UFW`.

## How to Run & Verify the Project

### Prerequisites
*   Vagrant installed on your host machine.
*   VMware Desktop Provider configured (optimized for Apple Silicon/ARM architectures).
