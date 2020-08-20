#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
int main()
{
	float rand_num;
    for(int i=0;i<15;i++)
	{
	    printf("{");
		for(int j=0;j<15;j++)
		{
			rand_num = (rand()%10+4);
			if(j==14)
            {
                printf("%f",rand_num);
                break;
            }
			printf("%f,",rand_num);
		}
		printf("}");
		printf(",\n");
	}
}


