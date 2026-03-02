# Engineering Guidelines

This document defines minimal engineering conventions for the homelab-infra project.

The goal is to maintain clarity, traceability and production-like discipline,
while keeping overhead low for a single-engineer environment.

---

## 1. Commit Naming Convention

Commit messages must clearly describe:

- the domain affected (terraform, k8s, ci, docs, monitoring, etc.)
- the intent of the change

Format:

<domain>: short description

Examples:

terraform: add static IP model
k8s: deploy nginx ingress
ci: refactor workflow structure
docs: introduce ADR-0003
fix(terraform): correct network configuration

Rules:

- Keep the message concise.
- One logical change per commit.
- Avoid vague messages such as "update", "fix", "changes".

---

## 2. Pull Request Policy

Each Pull Request must:

- represent one logical change
- explain why the change is introduced
- reference related ADR (if architectural)

Large unrelated changes must be split into multiple PRs.

---

## 3. Infrastructure Boundaries

Responsibilities of layers:

- Terraform manages infrastructure lifecycle (VMs, networks, storage).
- Kubernetes manages workloads.
- Terraform must not manage Kubernetes workloads directly.
- Kubernetes must not manage VM lifecycle.

This separation prevents responsibility overlap and architectural drift.

---

## 4. State Governance

Terraform state:

- Must never be edited manually.
- Must never be modified outside Terraform CLI.
- All changes must go through `terraform plan` and `terraform apply`.

Manual state manipulation is considered a production-risk operation.

---

## 5. Secrets Policy

- No secrets must be committed to the repository.
- SSH keys, tokens, kubeconfigs and credentials must remain outside Git.
- Future secret management will be handled via Vault or external secret mechanisms.

---

## 6. Definition of Done (Infrastructure Changes)

An infrastructure change is considered complete when:

- Code is applied successfully.
- Infrastructure is reachable and operational.
- Reasoning is documented (ADR if required).
- No manual drift is introduced.