#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

module load openmpi
nvcc -ccbin mpicxx -o /mnt/share1/hello /home/cc/hello.cu
mpirun --host "$ALL_HOSTNAMES" /mnt/share1/hello
