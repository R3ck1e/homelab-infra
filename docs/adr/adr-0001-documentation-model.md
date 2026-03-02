# ADR-0001: Documentation Governance and ADR Model

## Status
Accepted

## Context

As the homelab-infra project evolves to include multiple domains
(Terraform, Kubernetes, monitoring, CI/CD, networking),
documentation complexity increases.

Without a defined documentation governance model,
architectural decisions may be inconsistently recorded,
overwritten, or lost over time.

A structured, version-controlled, and historically traceable
documentation approach is required to maintain clarity,
decision history, and long-term maintainability.

## Decision

1. All project documentation is stored inside the repository under the `/docs` directory.
2. Documentation language is English.
3. Architectural decisions must follow the ADR (Architecture Decision Record) model.
4. ADRs are immutable. If a decision changes, a new ADR must be created and must supersede the previous one.
5. Documentation structure is domain-oriented:

   - `docs/domain/` — domain-specific documentation (terraform, k8s, monitoring, etc.)
   - `docs/general/` — cross-cutting documentation (architecture overview, governance)
   - `docs/adr/` — architecture decision records

## Consequences

### Positive

- Clear and auditable architectural decision history
- Traceable evolution of the system
- Improved long-term maintainability
- Easier onboarding and knowledge transfer
- Alignment with production-grade documentation practices

### Negative

- Additional overhead for documenting decisions
- Requires discipline to maintain documentation consistency
- Risk of documentation drift if governance is not enforced

## Scope

This ADR defines documentation governance for the entire repository.
All future architectural decisions must be recorded as ADRs.