#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <sstream>
#include <cstdio>
#include <string>
#include <wait.h>
#include <deque>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

using namespace std;

int main(int argc, char* argv[]) {
        if (argc<=1) {
            cout << "Keves parameter" << endl;
            exit(1);
        }
        int nulla = open("/dev/null",O_WRONLY);
        string path = getenv("PATH");
        stringstream s_path(path);
        string buffer;
        deque<string> list;

        while (getline(s_path,buffer,':')) {
                list.push_back(buffer);
        }

        for (int i=1;i<argc;i++){

            string act(argv[i]);
		    //bool isInPath = false;
			//int numberOfItems = 0;

			for (string PathElement : list) {

                pid_t pid;

				if ((pid = fork())==-1) {
					cout << "Fork Hiba"<<endl;
					exit(1);
				}

                if (pid == 0){
                    if (dup2(nulla,2)<0){
                        perror("Dup problem");
                        exit(1);
                    }
                    string temporal = PathElement + "/" + act;
                    const char* forExecl = temporal.c_str();
                    cout << execl("/usr/bin/stat","stat","-c \"%F %A %n\" ",forExecl,NULL) << endl;
                    close(nulla);
                	exit(0);
                }
            }
        }

        while (wait(NULL)>0);


        return 0;
}