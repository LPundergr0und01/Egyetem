//Szabo Robert Istvan
//srim1761
//524/1

#include "head.h"

int main(){
    int n = 3;
    int shmfd;
    int pid = getpid();
    struct matrix *p = (struct matrix*)malloc(sizeof(struct matrix));
	if((shmfd = shmget((key_t)KEY, 0, 0)) == -1){
		perror("Nem sikerult megnyitni");
		exit(1);
	};
    p = shmat(shmfd,NULL,0);


    do{
        sem_wait(&(p->modosit));
        sleep(n);
        p->done = 1;
        int s=0;
        int i,j;
        for (i=0;i<5;i++){
            for (j=0;j<5;j++){
                s = 0;
                if (i == j ==0)
                    continue;
                if (i == j == 4)
                    continue;
                if (i == 0 && j ==4)
                    continue;
                if (i == 4 && j == 0)
                    continue;
                if (i == 0 && j > 0 && j <4){
                    s = p->a[0][j-1]+p->a[0][j+1]+p->a[1][j-1]+p->a[1][j]+p->a[1][j+1];
                    //0.sor modositasa
                    if (s == 5 && p->a[0][j] != 1){
                    p->a[0][j] = 1;
                    p->done = 0;
                    }

                    if (s == 0 && p->a[0][j] != 0){
                        p->a[0][j] = 0;

                        p->done = 0;
                    }
                }
                //printf("OK\n");
                if (i == 4 && j > 0 && j <4){
                    s = p->a[4][j-1]+p->a[4][j+1]+p->a[18][j-1]+p->a[18][j]+p->a[18][j+1];
                    //4.sor modositasa
                    if (s == 5 && p->a[4][j] != 1){
                        p->a[4][j] = 1;
                        p->done = 0;
                    }

                    if (s == 0 && p->a[4][j] != 0){
                        p->a[4][j] = 0;
                        p->done = 0;
                    }
                }

                //printf("OK\n");
                if (j == 0 && i > 0 && i < 4){

                    s = p->a[i-1][0]+p->a[i+1][0]+p->a[i-1][1]+p->a[i][1]+p->a[i+1][1];
                    //0. oszlop
                    if (s == 5 && p->a[i][0] != 1){
                        p->a[i][0] = 1;
                        p->done = 0;
                    }

                    if (s == 0 && p->a[i][0] != 0){
                        p->a[i][0] = 0;
                        p->done = 0;
                    }
                }


                //printf("OK\n");
                if (j == 4 && i > 0 && i < 4){

                    s = p->a[i-1][4]+p->a[i+1][4]+p->a[i-1][18]+p->a[i][18]+p->a[i+1][18];
                    //4. oszlop
                    if (s == 5 && p->a[i][4] != 1){
                        p->a[i][4] = 1;
                        p->done = 0;
                    }

                    if (s == 0 && p->a[i][4] != 0){
                        p->a[i][4] = 0;
                        p->done = 0;
                    }


                }
                if (i > 0 && i < 4 && j > 0 && j < 4){
                    s = p->a[i-1][j-1]+p->a[i-1][j]+p->a[i-1][j+1]+p->a[i][j-1]+p->a[i][j+1]+p->a[i+1][j-1]+p->a[i+1][j]+p->a[i+1][j+1];
                    if (s > 5 && p->a[i][j] != 1){
                            p->a[i][j] = 1;
                            p->done = 0;
                        }

                        if (s < 4 && p->a[i][j] != 0){
                            p->a[i][j] = 0;
                            p->done = 0;
                        }
                }
            }
        }

        sem_post(&(p->ir));
    }while(p->done == 0);


    shmctl(shmfd, IPC_RMID, 0);
	printf("Osztott memoria felszabaditva\n");

    return 0;
}