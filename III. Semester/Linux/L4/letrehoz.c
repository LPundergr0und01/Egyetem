//Szabo Robert Istvan
//srim1761
//524/1


#include "head.h"

int main(){
    srand(time(0));
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

    struct matrix* p=(struct jatek*)malloc(sizeof(struct matrix));
    p=shmat(shmfd,NULL,0);

    p->done = 0;
    for (int i=0;i<5;i++)
        for (int j=0;j<5;j++)
            p->a[i][j] = rand()%2;

	initSzemaforok(p);

    for (int i=0;i<5;i++){
        sem_wait(&(p->ir));

        for (int i= 0;i < 5; i++){
            for (int j=0;j<5;j++){
                printf("%d ",p->a[i][j]);
            }
            printf("\n");
        }

        printf("\n\n");
        if (p->done == 1)
            break;
        sem_post(&(p->modosit));
    }

    return 0;
}