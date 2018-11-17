//srim1761
//Szabo Robert Istvan
#include <string.h>
#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <sstream>
#include <cstdio>
#include <wait.h>
#include <deque>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <signal.h>
#include <errno.h>

using namespace std;

static void sig_intr(int);
static void sig_quit(int);
static void sig_term(int);
int ksz=1;
struct data{
  char ido[100];
  char type[100];
} calls[100];

int ind=0;

int main(void)
{
  if (signal(SIGINT, sig_intr) == SIG_ERR)
    perror("hiba: signal(SIGINT, ...)");
  if (signal(SIGQUIT, sig_quit) == SIG_ERR)
    perror("hiba: signal(SIGQUIT, ...)");
  if (signal(SIGTERM, sig_term) == SIG_ERR)
    perror("hiba: signal(SIGTERM, ...)");
  while(ksz == 1) pause();
  for(int i=0;i<ind;i++){
    cout<<calls[i].type<<": "<<calls[i].ido<<endl;
  }
  sleep(2);
}

static void sig_quit(int sig)
{
  time_t timetmp = time(0);
  struct tm temp;
  temp = *localtime(&timetmp);
  strftime(calls[ind].ido, sizeof(calls[ind].ido), "%Y-%m-%d.%X", &temp);
  strcpy(calls[ind].type,"SIGQUIT");
  ind++;
  return;
}

static void sig_intr(int sig)
{
  time_t timetmp = time(0);
  struct tm temp;
  temp = *localtime(&timetmp);
  strftime(calls[ind].ido, sizeof(calls[ind].ido), "%Y-%m-%d.%X", &temp);
  strcpy(calls[ind].type,"SIGINT");
  ind++;
  return;
}

static void sig_term(int sig)
{
  printf("SIGTERM jelet vettem...\n");
  ksz=0;
  return;
}