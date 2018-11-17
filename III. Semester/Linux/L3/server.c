//Szabo Robert Istvan
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include "head.h"

int main(int argc, char *argv[]){
    int shmfd;
	int pid=getpid();
    shmfd=shmget((key_t)KEY, SEG_LENGTH, IPC_CREAT | IPC_EXCL | 0666);
    if (shmfd == -1){
        printf("Az osztott memoria mar le van foglalva\n");
        if ((shmfd=shmget((key_t) KEY, SEG_LENGTH, 0)) == -1){
            perror("Nem sikerult megnyitni\n");
            exit(1);
        }
    }
    struct jatek *serverStruct=(struct jatek*)malloc(sizeof(struct jatek));
    serverStruct=shmat(shmfd,NULL,0);
    printf("Jatekos csatlakozasara varunk\n");
        while(serverStruct->player1 == 0);
        printf("meg egy\n");
        while(serverStruct->player2 == 0);
        printf("start\n");
        while(serverStruct->talalat != -1);
    printf("A jateknak vege\n");
    shmctl(shmfd, IPC_RMID, 0);
	printf("Osztott memoria felszabaditva\n");
    return 0;
}