# ADR-0002: Domain-Based Branch Naming Model

## Status
Accepted

## Context

The project is a mono-repository containing multiple infrastructure domains
(Terraform, Kubernetes, CI/CD, monitoring, networking).

As development progresses, parallel changes across different domains
must remain clearly separated and easily traceable.

Without a defined branch naming model:

- change scope becomes unclear
- review context is harder to understand
- history becomes harder to navigate
- scaling collaboration becomes more difficult

A consistent and domain-oriented branching strategy is required.

## Decision

Branches must follow a domain-based naming convention:

- `terraform/*`
- `k8s/*`
- `ci/*`
- `monitoring/*`
- `runner/*`
- `docs/*`

Each branch name must reflect:

1. The primary domain affected.
2. The specific change or feature being introduced.

Examples:

- `terraform/add-network-module`
- `k8s/introduce-ingress`
- `docs/adr-0003-network-isolation`

## Consequences

### Positive

- Clear mapping between changes and domains
- Improved traceability
- Easier code review
- Better scalability for future collaboration

### Negative

- Requires discipline in branch creation
- May introduce additional short-lived branches