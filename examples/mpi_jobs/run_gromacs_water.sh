#!/bin/bash

MASTER_HOSTNAME=$1
WORKER_HOSTNAMES=$2
ALL_HOSTNAMES="$MASTER_HOSTNAME,$WORKER_HOSTNAMES"

wget https://ftp.gromacs.org/pub/benchmarks/water_GMX50_bare.tar.gz
tar -xvzf water_GMX50_bare.tar.gz
cd water-cut1.0_GMX50_bare/1536

module load openmpi gromacs pdsh
gmx_mpi grompp -f pme.mdp -c conf.gro -p topol.top -o /home/cc/pme.tpr

pdcp -R ssh -w "$WORKER_HOSTNAMES" /home/cc/pme.tpr /home/cc/

mpirun --host "$ALL_HOSTNAMES" bash -lc 'module load openmpi gromacs && gmx_mpi mdrun -s /home/cc/pme.tpr -nsteps 100 -ntomp 1 -deffnm /home/cc/pme-test'
