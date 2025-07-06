#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

module load openmpi pdsh
mpicc /home/cc/hello.c -o /home/cc/hello
pdcp -R ssh -w "$WORKER_HOSTNAMES" /home/cc/hello /home/cc
mpirun --host "$ALL_HOSTNAMES" /home/cc/hello
