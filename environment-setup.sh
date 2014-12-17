#!/bin/sh

# tested on Carver at NERSC:
module swap pgi gcc 
module swap openmpi openmpi-gcc
module load papi


export TAU_ROOT=$HOME/usr/src/tau2/x86_64/lib
#export TAU_MAKEFILE=$TAU_ROOT/Makefile.tau-ga-5-2-mpi-pthread-pdt
#export TAU_MAKEFILE=$TAU_ROOT/Makefile.tau-ga-5-2-papi-papi-mpi-pthread-pdt
export TAU_MAKEFILE=$TAU_ROOT/Makefile.tau-ga-5-2-papi-module-papi-mpi-pthread-pdt
export PATH=$HOME/usr/src/tau2/x86_64/bin:$PATH
#export PATH=$HOME/usr/local/papi-5.3.0/bin:$PATH
export LD_LIBRARY_PATH=$HOME/usr/local/ga-5-2-gcc/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$HOME/usr/local/ga-5-2-tau/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/usr/src/xianyi-OpenBLAS-9c51cdf:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/Repos/NWChem-mini-app/workq:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/usr/src/tau2/x86_64/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$HOME/usr/local/papi-5.3.0/lib:$LD_LIBRARY_PATH
export OMP_NUM_THREADS=1

