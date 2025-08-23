#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

module load mpich
mkdir -p /mnt/share1/cc
nvcc -ccbin mpicxx -o /mnt/share1/cc/hello /home/cc/hello.cu
mpirun -ppn 1 --host "$ALL_HOSTNAMES" /mnt/share1/cc/hello
