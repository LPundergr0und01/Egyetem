#ifndef JATEK_H
#define JATEK_H

int KEY=2008;
int SEG_LENGTH=100;

struct jatek{
int soros;
int player1;
int player2;
int x;
int y;
int talalat;
};
int validation(int x,int y,int irany){
    if (x<1 || x > 12 || y < 1 || y > 12)
        return 1;
    else if (x>6 && irany == 1) // vizszintes
        return 1;
    else if (y>6 && irany == 0) // fuggoleges
        return 1;
    else
    return 0;
}

void rajzol(int a[12][12]){
    int i=0;
	int j=0;
	for(i=0; i<12; i++){
                for(j=0; j<12; j++){
                        if(a[i][j]==0){
                                printf(". ");
                        }
			else if(a[i][j]==1){
                                printf("0 ");
                        }
			else{
                                printf("X ");
                        }
                }
                printf("\n");
        }
}

int dead(int a[12][12]){
    for (int i = 0;i<12;i++)
        for (int j=0;j<12;j++)
            if (a[i][j]==1)
                return 0;
    return -1;
}
#endif
