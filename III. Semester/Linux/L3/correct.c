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

int main(){
    int shmfd;
    int pid = getpid();
    struct jatek *player = (struct jatek*)malloc(sizeof(struct jatek));
	if((shmfd = shmget((key_t)KEY, 0, 0)) == -1){
		perror("Nem sikerult megnyitni");
		exit(1);
	};
    player = shmat(shmfd,NULL,0);
    player ->player1 = 0;
    player ->player2 = 0;
    player->soros = 0;
    player->x = -1;
    player->y = -1;
    player->talalat = 0;
    shmctl(shmfd, IPC_RMID, 0);
    return 0;
}