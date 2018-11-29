/*
**
** memsweep.c        Benchmark to measure memory access performance
**                   (measures time to access large heap array at
**                   varying locations)
**
** To compile:  gcc -O -o memsweep memsweep.c -lm
**
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <float.h>

#define ARR_SIZE (8096 * 4096)

static double second(void)
{
    return ((double)((double)clock()/(double)CLOCKS_PER_SEC));
}

void main(void)
{
for(int i=0; i < 1; i++){

  unsigned int i;
  double time2;
  volatile char* array;
  
  array = (char*) malloc(sizeof(char)*ARR_SIZE);
  
  time2 = second();
  for (i = 0; i < 10 * ARR_SIZE; i++)
  {
    array[(4096 * i + i) % ARR_SIZE] = 1 + array[i % ARR_SIZE];
  }
  free((void*)array);
  time2 = second() - time2;
  printf("Memsweep time in seconds: %.3f\n", time2);
  FILE * fp;
    int now;
    int later; 

    fp = fopen ("./result2.csv", "a");
    fprintf(fp, "%d, %f \n", (int)time(NULL), time2 );
   
    fclose(fp);
    /*now = second();
    later = second();
    while (later - now < 3600){
	later = second();
    }*/
}

}

