#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int forksum(int start, int end);

int main(int argc, char *argv[])
{
    if (argc != 3) {
        printf("please use the syntax : ./forksum int1 int2, where int1 < int2\n");
    } else {
        int start = (int)atoi(argv[1]);
        int end = (int)atoi(argv[2]);
        
        int result = forksum(start, end);
        printf("%d\n", result);
        // int real_result = end * (end + 1) / 2 - (start-1) * start / 2;
        // printf("real result = %d\n", real_result);
    }
    return 0;
}

int forksum(int start, int end)
{
    if (start == end)
    {
        return start;
    }
    else
    {
        int childResult = -1;
        int parentResult = -1;
        int pipeDescriptorResults[2]; //array used to transfer data between process

        while (pipe(pipeDescriptorResults) != 0); // create pipe or repeat if failure

        pid_t childPid = -1;
        while (childPid == -1) {
            pid_t childPid = fork();
            if (childPid == 0) // in child process
            { 
                close(pipeDescriptorResults[0]);

                end = (int)( (start + end) / (float) 2 );
                childResult = forksum(start, end);

                write(pipeDescriptorResults[1], &childResult, sizeof(int));
                exit(0);
            }
            else if (childPid != -1) // in parent process
            {
                close(pipeDescriptorResults[1]);

                start = (int)( (start + end) / (float) 2 + 1);
                parentResult = forksum(start, end);

                // wait for result of child process
                read(pipeDescriptorResults[0], &childResult, sizeof(int)); 

                wait(NULL);
                return childResult + parentResult;
            }
        }
    }
}