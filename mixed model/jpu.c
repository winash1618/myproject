#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define n 3
#define dt 10
#define sta 4
#define w 6.1
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0;
float d[n]={5,3,2};
float length[sta]={12,14,12,11};
float tme[sta][n]={{4,8,7},{6,9,4},{8,6,6},{4,7,5}};
double fit,z[dt][sta],z1[dt][sta],u[dt][sta],u1[dt][sta],mat[sta];
int x[dt][n];
int sol[dt]={0,1,2,0,0,1,2,0,1,0};
void sequence_matrix(void);
void util_work(void);
void start_pos(void);
void fitness_value(void);
int main()
{
    sequence_matrix();
    start_pos();
    util_work();
    fitness_value();

        for(j=0;j<dt;j++)
       {
            printf("%d,",sol[j]);
        }

    printf("               ");
    printf("%f",(fit));

}

//recreating sequence matrix
void sequence_matrix(void)
{
    int j,k;
    for(k=0;k<n;k++)
    {
        for(j=0;j<dt;j++)
        {
            if(k==sol[j])
            {
                x[j][k]=1;

            }
            else
            {
				x[j][k]=0;
            }
            printf("   %d  ",x[j][k]);
        }
        printf("\n");
    }
}
//finding start position
void start_pos(void)
{
	int i,j,k;
	float temp=0,temp1=0;
	for(i=0;i<=dt;i++)
        {
            if(i<dt)
            {
            for(j=0;j<sta;j++)
            {
				if(i==0)
				{
					z[i][j]=0;
				}
				else
				{
					temp=0;
					for(k=0;k<n;k++)
					{
						temp+=x[i-1][k]*tme[j][k];
						/*printf("%f   ",temp);
						printf("%f   ",tme[j][k]);
						printf("%d   \n",x[i-1][k]);
						/*if(i==9 && j==2)
                        {
                            printf("%f   ",tme[j][k]);
                            printf("%f   ",temp);
                            printf("%d   \n",x[i-1][k]);
                        }*/
					}
					//printf("\n");
                //printf("%f \n",temp);
					temp+=z[i-1][j]-w;
					temp1=length[j]-w;
					/*if(i==9 && j==2)
                    {
                        printf("%f   ",temp);
                            printf("%f   \n",temp1);
                        }*/
					/*printf("%f    ",temp);

					printf("%f   ",temp1);*/
					if(temp<temp1)
					{
						if(temp>0)
						{
							z[i][j]=temp;
                            //printf("%f \n",temp);
						}
						else
						{
							z[i][j]=0;
						}
					}
					else
					{
						if(temp1>0)
						{
							z[i][j]=temp1;
							/*if(i==9 && j==2)
                    {
                        printf("%f   ",z[i][j]);
                            printf("%f   \n",temp1);
                        }*/
							//printf("%f \n",temp1);
						}
						else
						{
							z[i][j]=0;
						}
					}


				}
				//printf("%f \n",temp1);
				printf("  %f   ",z[i][j]);
			}
            printf("\n");
            }
            else
            {
                 for(j=0;j<sta;j++)
                {
                    temp=0;
                    temp1=0;
                    for(k=0;k<n;k++)
					{
						temp+=x[i-1][k]*tme[j][k];
						printf("%f ",temp);
						printf("%f ",tme[j][k]);
						printf("%d   \n",x[i-1][k]);
					}

					temp+=z[dt-1][j]-w;
					temp1=length[j]-w;
					if(temp<temp1)
					{
						if(temp>0)
						{
							mat[j]=temp;
                            //printf("%f \n",temp);
						}
						else
						{
							mat[j]=0;
						}
					}
					else
					{
						if(temp1>0)
						{
							mat[j]=temp1;
						}
						else
						{
							mat[j]=0;
						}
					}
                }
            }

		}
}
//amount of utility work required
void util_work(void)
{
	int i,j,k;
	float temp=0;
	for(i=0;i<dt;i++)
	{
        for(j=0;j<sta;j++)
        {
			temp=0;
			for(k=0;k<n;k++)
			{
				temp+=x[i][k]*tme[j][k];
				/*printf("%f   ",temp);
                printf("%f   ",tme[j][k]);
                printf("%d   \n",x[i][k]);*/
			}
			//printf("%f \n",temp);
			temp+=z[i][j]-length[j];
			//printf("%f \n",temp);
			if(temp>0)
			{
				u[i][j]=temp;
				//printf("%f \n",temp);
			}
			else
			{
				u[i][j]=0;
			}

			printf("  %f ",u[i][j]);
		}
		printf("\n");
	}

}
//finding fitness value
void fitness_value(void)
{
    int i,j;
	float temp=0;

    for(j=0;j<sta;j++)
        {
			temp=0;
            for(i=0;i<dt;i++)
            {
				temp+=u[i][j];
			}
			printf("%f  ",temp);

			fit+=temp+mat[j];
			printf("   %f \n",z[dt-1][j]);
        }

}


