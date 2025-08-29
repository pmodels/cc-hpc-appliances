#!/bin/bash

module load mpich
nvcc -ccbin mpicxx -o /mnt/share1/hello /home/cc/hello.cu
mpirun -ppn 1 --hostfile /etc/mpi/hostfile /mnt/share1/hello
