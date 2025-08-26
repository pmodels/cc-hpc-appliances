#!/bin/bash

module load mpich
mkdir -p /mnt/share1/cc
nvcc -ccbin mpicxx -o /mnt/share1/cc/hello /home/cc/hello.cu
mpirun -ppn 1 --hostfile /etc/mpi/hostfile /mnt/share1/cc/hello
