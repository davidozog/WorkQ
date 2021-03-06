#ifndef _WORK_QUEUE_H
#define _WORK_QUEUE_H

#define MSG_NUMB 2
#define MSG_TYPE 1
#define MAXMICROTASKS 4096
#define NUM_MSGQS 1
#define NUM_QUEUES 1
#define USE_POSIX_SHM 1
//#define USE_MPI_SHM 1
#ifdef FTOKM
  #define FTOK_FILEPATH FTOKM
#endif
#ifdef FTOKD
  #define FTOK_DATAPATH FTOKD
#endif

/* Specific to macro-task: */
struct num_tasks {
    long mtype;
    int ntasks;
    int dimc;
    int shm_key; 
    int data_id;
    int data_size;
    int a;
    int b;
    int c;
    int d;
    int tce_key;
};

/* Specific to micro-task: */
struct my_msgbuf {
    long mtype;
    int task_id;
    int dima_sort;
    int dimb_sort;
    int dim_common;
    int nsuper1;
    int nsuper2;
    int e;
    int f;
};

/* For simpler benchmark: */
struct bench_buf {
    long mtype;
    int task_id;
    int tile_dim;
};



#endif
