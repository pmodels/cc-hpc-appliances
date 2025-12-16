# Chameleon Cloud HPC Appliances

This repo contains the latest version which is available in the Trovi Artifact titled "[MPI and Spack Based HPC Cluster](https://trovi.chameleoncloud.org/dashboard/artifacts/7424a8dc-0688-4383-9d67-1e40ff37de17)".

The Trovi artifact provides a reproducible, ready-to-use HPC cluster on the [Chameleon Cloud](https://chameleoncloud.org/), 
with automated setup of nodes for immediate execution of MPI-based tasks/applications.

## Introduction

Message Passing Interface (MPI) is the backbone of high-performance computing (HPC), enabling efficient scaling across thousands of processing cores.

This project provides a reproducible MPI setup on the Chameleon testbed. It deploys an MPI cluster on a configurable number of nodes. Users login to a "main" node. 
From there, MPI applications can be built and run across the entire cluster.

## Features

- **Pre-built Images for Different Workloads**: Choose from [CPU-only](https://chameleoncloud.org/appliances/127/), [CUDA](https://chameleoncloud.org/appliances/130/), or [ROCm](https://chameleoncloud.org/appliances/131/) images depending on your computation needs. Each image comes pre-configured and is available in the Appliance catalog.
- **MPI Ready Cluster**: Every node has [MPICH](https://www.mpich.org/), [OpenMPI](https://www.open-mpi.org/) and [Spack](https://spack.io/) installed and configured, allowing you to immediately compile and run parallel applications without manual setup.
- **Shared Filesystem Support**: [Chameleon NFS shared filesystem](https://chameleoncloud.readthedocs.io/en/latest/technical/shares/) can be set up to easily share data across all nodes in the cluster (available only on sites that support Chameleon Shared File System like CHI@UC).
- **Quick Start Examples**: Jupyter notebooks using Python-CHI and [OpenStack Heat Template](https://chameleoncloud.org/appliances/132/) are included for rapid experimentation and deployment, helping you get started with minimal effort.
