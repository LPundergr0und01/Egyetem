//Szabo Robert Istvan
//srim1761
//524/1

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <time.h>

int KEY=5008;
int SEG_LENGTH=100;
#define SHMOBJ_PATH	"/tmp"
 //HA HIBA VAN AKKOR ITT KELL KERESNI ELOSZOR
#define SHMOBJ_PATH	"/tmp"


struct matrix{
    int a[5][5];
    sem_t ir;
    sem_t modosit;
    int done;
};


int SHGenerate()
{
	int shmfd = shmget((key_t)KEY, SEG_LENGTH, IPC_CREAT | IPC_EXCL | 0666);
  	//ha már van ilyen key kulcsú szemafor létrehozva
  	if (shmfd == -1){
    		shmfd = shmget((key_t)KEY, SEG_LENGTH, IPC_CREAT | IPC_EXCL | 0666);
    		if (shmfd < 0) {
    			perror("In shm_open()");
        		exit(1);
    		}

		/* adjusting mapped file size (make room for the whole segment to map) --  ftruncate() */
		ftruncate(shmfd, sizeof(struct matrix));
	}
  return shmfd;
}


void initSzemaforok(struct matrix* p){
    if(sem_init(&(p->ir),1,1) < 0 ){
		perror("In sem_init()");
		exit(1);
	}
	if(sem_init(&(p->modosit),1,0) < 0){
		perror("In sem_init()");
		exit(1);
	}
}
