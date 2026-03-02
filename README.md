# homelab-infra

## Branch naming convention

We use domain-based branch naming:

- ci/*
- terraform/*
- k8s/*
- ansible/*
- runner/*
- monitoring/*

## Documentation

Project documentation is stored under the `/docs` directory.

Structure:

- docs/domain/ – domain-specific documentation (terraform, k8s, monitoring, etc.)
- docs/general/ – cross-cutting documentation (architecture overview, decisions, governance)
- docs/adr/ – Architecture Decision Records

Documentation language: English  
Architecture decisions follow ADR model.