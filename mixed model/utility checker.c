#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define n 15
#define dt 100
#define sta 15
#define w 8.1
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0;
float d[n]={40,40,8,1,1,1,1,1,1,1,1,1,1,1,1};
float length[sta]={21,23,22,29,30,24,26,31,28,20,29,25,21,24,28};
float tme[sta][n]={
{7.0,7.0,7.0,7.0,11.0,9.0,9.0,14.0,9.0,10.0,13.0,12.0,9.0,9.0,9.0},
{9.0,14.0,7.0,12.0,8.0,6.0,6.0,10.0,11.0,16.0,12.0,15.0,16.0,6.0,12.0},
{7.0,12.0,14.0,10.0,11.0,7.0,7.0,11.0,14.0,16.0,13.0,18.0,11.0,7.0,8.0},
{15.0,7.0,16.0,7.0,14.0,15.0,11.0,14.0,9.0,16.0,14.0,8.0,7.0,12.0,15.0},
{10.0,7.0,7.0,7.0,6.0,6.0,12.0,10.0,16.0,11.0,11.0,11.0,7.0,7.0,11.0},
{12.0,9.0,10.0,12.0,8.0,17.0,13.0,17.0,15.0,7.0,14.0,9.0,14.0,10.0,12.0},
{18.0,15.0,16.0,15.0,9.0,7.0,7.0,13.0,12.0,18.0,17.0,10.0,16.0,17.0,16.0},
{9.0,17.0,7.0,13.0,7.0,9.0,13.0,14.0,9.0,11.0,12.0,12.0,11.0,11.0,9.0},
{11.0,16.0,8.0,17.0,11.0,17.0,14.0,12.0,13.0,10.0,6.0,9.0,6.0,10.0,18.0},
{13.0,11.0,7.0,13.0,13.0,10.0,8.0,9.0,18.0,13.0,15.0,18.0,7.0,9.0,16.0},
{15.0,10.0,9.0,15.0,11.0,17.0,7.0,10.0,7.0,7.0,12.0,12.0,16.0,15.0,12.0},
{6.0,11.0,14.0,11.0,16.0,11.0,9.0,13.0,8.0,8.0,17.0,17.0,10.0,12.0,16.0},
{14.0,14.0,9.0,8.0,7.0,8.0,12.0,11.0,7.0,12.0,15.0,8.0,13.0,6.0,6.0},
{18.0,18.0,13.0,12.0,15.0,17.0,13.0,17.0,11.0,16.0,7.0,7.0,11.0,7.0,16.0},
{16.0,17.0,15.0,10.0,17.0,12.0,8.0,13.0,13.0,11.0,9.0,16.0,7.0,14.0,12.0}
};
double fit,z[dt][sta],z1[dt][sta],u[dt][sta],u1[dt][sta],mat[sta];
int x[dt][n];
int sol[dt]={0,1,0,1,2,1,0,0,1,1,0,10,1,0,2,0,1,1,0,4,0,1,0,1,8,0,1,1,0,2,1,0,1,0,13,1,0,1,0,6,0,1,2,1,0,0,1,5,0,1,0,1,9,1,0,1,0,2,1,0,12,1,0,1,0,3,1,0,1,0,2,0,1,0,1,11,0,1,1,0,7,1,0,0,1,2,1,0,14,1,0,0,1,0,1,2,1,0,0,1};
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


