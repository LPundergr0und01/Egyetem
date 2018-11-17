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
    int x,y,direction;
    if (argc != 4){
        printf("Nem megfelelo parameterek");
        printf("Hasznalat:\n");
        printf("          x - sorszam\n");
        printf("          y - oszlopszam\n");
        printf("          direction - irany (0,1)\n");
        printf("                    0 - vizszintes\n");
        printf("                    1 - fuggoleges\n");
        exit(1);
    }
    x=atoi(argv[1]);
	y=atoi(argv[2]);
    direction = atoi(argv[3]);
    int ok = validation(x,y,direction);
    if (ok==1){
        printf("Hiba\n");
        exit(1);
    }
    int shmfd;
    int pid = getpid();
    struct jatek *player = (struct jatek*)malloc(sizeof(struct jatek));
	if((shmfd = shmget((key_t)KEY, 0, 0)) == -1){
		perror("Nem sikerult megnyitni");
		exit(1);
	};
    player = shmat(shmfd,NULL,0);
    int map[12][12] = {0};

    int i = 0;
        if (direction == 0){
            for (i = 0;i < 7 ; i++){
                map[x-1][y-1+i] = 1;
            }
        }
        if (direction == 1){
            for (i = 0;i < 7 ; i++){
                map[x-1+i][y-1] = 1;
            }
        }
    if (player->player1!=0 && player->player2!=0){
        printf("Egy jatek mar folyamatban van...\n");
        printf("Kerem varjon amig a jelenlegi jatek veget er...\n");
        while(player->player1==0 || player->player2==0);
    }else{
        if (player->player1==0){
            player->player1 = pid;
            player->soros = pid;
            printf("Ellenfel csatlakozasara varakozunk\n");
            while(player->player2==0);
        }else if (player->player2==0){
            player->player2 = pid;
        }

        printf("A jatek elkezdodott.\n");
        player->talalat = 1;
        player->x = -1;
        player->y = -1;
        //////////////////////////////////////////////////////////////////////////////////////
        //                                 GAME
        /////////////////////////////////////////////////////////////////////////////////////


        do {//jatek menete, mig valamelyik hajo el nem sulyed


            if (pid == player->player1 && pid == player->soros){
                                                //PLAYER1

                do{//talalat ellenorzese es a vezerles atadasa ha szukseges
                    x = player->x-1;
                    y = player->y-1;
                    if (x < 0 || y < 0){
                        break;
                    }
                    if (map[x][y] == 1 ){
                        map[x][y] = 3;
                        player->talalat = dead(map);
                        if (player->talalat == -1){
                            player->soros = player->player2;
                            printf("Vesztettel\n");
                            break;
                        }
                        player->soros = player->player2;
                        while(player->soros != pid);
                    }
                    else{
                        player->talalat = 1;
                    }
               }while(player->talalat == 0);
                    if (player->talalat == -1){
                        // player->soros = player->player2;
                        break;
                    }

                rajzol(map);

                do {// elso jatekos kore mig talal
                   printf("Valassz celkoordinatakat (1 es 12 kozott)\n");
                    do{// celpont bekerese mig az helyes nem lesz
                                printf("x=");
                                scanf("%d",&x);
                                printf("y=");
                                scanf("%d",&y);
                    }while(x < 1 || x > 12 || y < 1 || y > 12);

                    player->x=x;
                    player->y=y;
                    player->soros=player->player2;
                    while(player->soros!=pid);// megvarom hogy a masik fel ertekelje ki a talalatot
                    if (player->talalat == 0){
                        printf("Talalt!\n\n");
                    }
                    if (player->talalat == -1){
                        printf("\n\n\t\tGYOZTEL\n\n");
                     
                      break; }
                    if (player->talalat == 1){
                        player->soros = pid;
                    }
                }while(player->talalat == 0);
            }
            if (pid == player->player2 &&  pid == player->soros){
            //                                       PLAYER2

                do{//talalat beallitasa
                    x = player->x-1;
                    y = player->y-1;
                    if (x < 0 || y < 0){
                        break;
                    }
                    if (map[x][y] == 1){
                        map[x][y] = 3;
                        player->talalat = dead(map);
                        if (player->talalat == -1){
                            printf("Vesztettel\n");
                            break;
                        }
                        player->soros = player->player1;
                        while(player->soros != pid);
                    }
                    else{
                        player->talalat = 1;
                    }
                }while(player->talalat != 1);
                    if (player->talalat == -1){
                            break;
                        }


                    rajzol(map);

                do{//2 jatekos kore mig talal
                    printf("Valassz celkoordinatakat (1 es 12 kozott)\n");
                        do{// celpont bekerese mig az helyes nem lesz
                                    printf("x=");
                                    scanf("%d",&x);
                                    printf("y=");
                                    scanf("%d",&y);
                        }while(x < 1 || x > 12 || y < 1 || y > 12);
                    player->x=x;
                    player->y=y;
                    player->soros=player->player1;
                        while(player->soros==player->player1);// megvarom hogy a masik fel ertekelje ki a talalatot
                        if (player->talalat == 0){
                            printf("Talalt!\n\n");
                        }
                        if (player->talalat == -1){
                            printf("\n\n\t\tGYOZTEL\n\n");
                            break;
                        }
                        if (player->talalat == 1){
                            player->soros = pid;
                        }
                }while(player->talalat == 0);
            }

        }while(player->talalat != -1); //jatek vege;
    }
    if (player->soros == player->player1){
        player->soros = player->player2;
    }
    if (player->soros == player->player2){
        player->soros = player->player1;
    }
    rajzol(map);
    printf("\n\nVEGE\n\n");
    player->talalat = -1;
    return 0;
}