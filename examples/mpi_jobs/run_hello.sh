#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

module load mpich
mpicc /home/cc/hello.c -o /mnt/share1/hello
mpirun -ppn 1 --hostfile /etc/mpi/hostfile /mnt/share1/hello
