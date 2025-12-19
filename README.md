# Internal Docker Images

This repository contains a set of **internal Docker images** used for development, CI/CD, and deployment. It serves as a central place for building and maintaining base images for various tools and languages, ensuring consistency and reliability across projects.

## Purpose

- Provide **base images** for different programming languages, tools, and utilities;
- Include **internal certificates** to enable secure communication with internal services;
- Standardize image building to simplify CI/CD pipelines and deployments;

## Structure

The repository is organized by tool or language, each with its own folder containing a Dockerfile:

```bash
internal-images:
├── ansible
│   ├── Dockerfile
│   └── README.md
├── go
│   └── 1.24.6
│       └── Dockerfile
├── protobuf
│   ├── Dockerfile
│   └── README.md
└── README.
```

Each folder contains a Dockerfile and any additional files needed to build the image. Images are typically tagged with both a **version/identifier** and `latest` to support deterministic builds as well as convenience.

## Internal Certificates

All images include internal certificates to trust internal services and registries. Certificates are added during the build process, so images can securely communicate with internal endpoints out of the box.

## CI/CD Integration

- Images are built using CI pipelines.
- Only Dockerfiles that have changed are rebuilt.
- Images are pushed with both a **commit-based tag** and `latest` tag to the internal container registry.

## Usage

To use any of the images, pull them from the internal container registry:

```bash
docker pull <registry>/<repository>/<image>:<tag>
```
