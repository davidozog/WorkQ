#!/bin/bash

if [ $1 = "--help" ]; then
  echo "Usage: ./launch.sh <name> <nodes> <ppn> <walltime> <threads> <tile_size> <num_collectors (optional)>"
  exit 0
fi

if [ "$#" -lt 6 ] ; then
  echo "$0: at least 6 arguments expected, try './launch.sh --help'"
  exit 3
fi

#cd ..
#source tau-ga-5-2-carver-setup.sh 
#make clean; make tau
#cd -
mkdir -p $1/ORIG
mkdir -p $1/WORKQ
cd $1
touch $1.sh

#PBS -l nodes=$2:ppn=$3
#let nproc=$2*24
#echo "num_procs is $nproc" 

echo "#!/bin/bash
#PBS -N minapp_$1
#PBS -l nodes=$2:ppn=8
#PBS -l walltime=$4
#PBS -q regular
#PBS -j oe
#PBS -m abe
#PBS -M david.m.ozog@gmail.com

#export TAU_TRACE=1

source $PWD/../../environment-setup.sh 

export OMP_NUM_THREADS=$5
export KMP_NUM_THREADS=$5

export PBS_JOBNUM=\${PBS_JOBID%%.*}
export JOBDIR=$PWD
export PROFILEDIR=\$JOBDIR/ORIG

export MA_USE_ARMCI_MEM=1
export BIN1=$PWD/../../bench.tau.orig
export BIN2=$PWD/../../bench.tau.workq
export MPIEXEC=/usr/common/usg/openmpi/1.4.5/gcc/bin/mpiexec
\${HOME}/usr/bin/kill_ipc_mpi
\${MPIEXEC} -npernode $3 \${BIN1} $6 $7 2> \${JOBDIR}/$1.\${PBS_JOBNUM}.orig.error 1> \${JOBDIR}/$1.\${PBS_JOBNUM}.orig.output

\${HOME}/usr/bin/kill_ipc_mpi
export PROFILEDIR=\$JOBDIR/WORKQ
\${MPIEXEC} -npernode $3 \${BIN2} $6 $7 2> \${JOBDIR}/$1.\${PBS_JOBNUM}.workq.error 1> \${JOBDIR}/$1.\${PBS_JOBNUM}.workq.output

\${HOME}/usr/bin/kill_ipc_mpi" >> $1.sh
qsub $1.sh -V
