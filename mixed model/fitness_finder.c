#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define n 3
#define dt 12
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0;
float d[n]={6,4,2};
double fit;
int x[n][dt],sol[dt]={1,1,3,2,2,1,2,1,1,3,2,1},s[n][dt];
void sequence_matrix(void);
void cumulative_matrix(void);
void fitness_value(void);
int main()
{
    for(i=0;i<dt;i++)
    {
       sol[i]=sol[i]-1;
    }
	sequence_matrix();
	cumulative_matrix();
	fitness_value();
	return 0;
}
void sequence_matrix(void)
{
    int j,k;
    for(k=0;k<n;k++)
    {
        for(j=0;j<dt;j++)
        {
            if(k==sol[j])
            {
                x[k][j]=1;

            }
            else
            {
				x[k][j]=0;
            }
        }
    }
    printf("%d a",x[k][j]);
}
//finding cumulative matrix
void cumulative_matrix(void)
{
    int i,k,j;
    for(i=0;i<n;i++)
    {
        for(j=0;j<dt;j++)
        {
            s[i][j]=0;
        }
    }
    for(k=0;k<n;k++)
    {
        for(i=0;i<dt;i++)
        {
            if(i==0)
            {
                if(x[k][i]==1)
                {
                    s[k][i]+=1;
                }
                else
                {
                    s[k][i]=0;
                }
            }
            else
			{
                if(x[k][i]==1)
                {
                    s[k][i]=s[k][i-1]+1;
                }
                else
                {
                    s[k][i]=s[k][i-1];
                }
            }
        }
    }
}
//finding fitness value
void fitness_value(void)
{
    int i,j;
    for(i=0;i<n;i++)
        {
            for(j=0;j<dt;j++)
            {
                fit+=((s[i][j]-((j+1)*d[i])/dt)*(s[i][j]-((j+1)*d[i])/dt));
            }
        }
		printf("%f",fit);
}
