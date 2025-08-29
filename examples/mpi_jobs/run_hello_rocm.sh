#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

module load openmpi pdsh
export OMPI_CC=hipcc
mpicc -o /home/cc/hello /home/cc/hello.cpp
pdcp -R ssh -w "$WORKER_HOSTNAMES" /home/cc/hello /home/cc
mpirun --host "$ALL_HOSTNAMES" /home/cc/hello
