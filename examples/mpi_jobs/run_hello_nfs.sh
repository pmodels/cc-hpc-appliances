#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

module load openmpi
mpicc /home/cc/hello.c -o /mnt/share1/hello
mpirun --host "$ALL_HOSTNAMES" /mnt/share1/hello
