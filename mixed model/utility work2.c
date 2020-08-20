#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define sn 10
#define t 500
#define n 3
#define dt 10
#define sta 4
#define w 6.1
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0,r=0,o=0;
float d[n]={5,3,2};
float length[sta]={12,14,12,11};
float time[n][sta]={4,8,7,6,9,4,8,6,6,4,7,5};
double fit[sn],fit1[sn],roule_prob[sn],cumulativ_prob[sn],z[dt][sta],z1[dt][sta],u[dt][sta],u1[dt][sta];
double rand_num,fitness=0,fitness_new=0;
int y[n][dt],x[n][dt],sol[sn][dt],sol1[sn][dt],x1[n][dt];
void initialization_phase(void);
void y_to_sequence(void);
void employed_bee_phase(void);
void onlooker_bee_phase(void);
void sequence_matrix(void);
void util_work(void);
void start_pos(void);
void fitness_value(void);
void roulette_wheel(void);
int main()
{
    for(k=0;k<sn;k++)
    {
        initialization_phase();
        y_to_sequence();
    }
    for(i=0;i<(t);i++)
    {
        fitness_new=0;
        for(j=0;j<sn;j++)
        {
           roule_prob[j]=0;
           cumulativ_prob[j]=0;
        }
        employed_bee_phase();
        onlooker_bee_phase();
        roulette_wheel();
    }
   for(i=0;i<sn;i++)
    {
        for(j=0;j<dt;j++)
       {
            printf("%d,",sol1[i][j]);
        }

    printf("               ");
    printf("%f",(fit1[i]));
    printf("\n");

    }
    printf("%d",o);
}
//finding the initial population
void initialization_phase(void)
{
    int i,j,k,l;
    for(i=0;i<n;i++)
    {
        for(j=0;j<dt;j++)
        {
            y[i][j]=0;
        }
    }
    for(i=0;i<n;i++)
    {
        c=0;
        for(j=0;j<dt;j++)
        {
            sum=0;
            rand_num = (rand()%100+1);
           if(rand_num < 50 && c<d[i])
           {
               for(k=0;k<n;k++)
               {
                   sum += y[k][j];
               }
               if(sum==0)
               {
                   y[i][j] = 1;
                   c++;
               }
           }
        }
    }
    for(i=0;i<n;i++)
    {
        sum1=0;
        for(l=0;l<dt;l++)
        {
            sum1 += y[i][l];
        }
        for(j=0;j<dt;j++)
        {
            sum=0;
            if(sum1 < d[i])
            {
                for(k=0;k<n;k++)
                {
                    sum += y[k][j];
                }
                if(sum==0)
                {
                    y[i][j] = 1;
                    sum1++;
                }
            }
        }
    }
}
void y_to_sequence(void)
{
    int i,j;
     for(i=0;i<n;i++)
    {
        for(j=0;j<dt;j++)
        {
            if(y[i][j]==1)//initial population
            {
                sol[k][j]=i;
                sol1[k][j]=i;
            }

        }
    }
}
//employed bee phase
void employed_bee_phase(void)
 {
    int i,temp=0,k1,k2;
    //printf("%f",prob);
    for(i=0;i<sn;i++)
    {
         r=0;
        while(r==0)
        {
            k1=rand()%dt;
            k2=rand()%dt;
            if(sol[i][k1]!=sol[i][k2]&& k1!=k2)
            {
                temp=sol[i][k1];
                sol[i][k1]=sol[i][k2];
                sol[i][k2]=temp;
                r++;
            }

        }
    }
}
//recreating sequence matrix
void sequence_matrix(void)
{
    int j,k;
    for(k=0;k<n;k++)
    {
        for(j=0;j<dt;j++)
        {
            if(k==sol[l][j])
            {
                x[k][j]=1;

            }
            else
            {
				x[k][j]=0;
            }
            if(k==sol1[l][j])
            {
				x1[k][j]=1;
			}
            else
            {
                x1[k][j]=0;
            }
        }
    }
}
//finding start position
void start_pos(void)
{
	int i,j,k;
	float temp=0,temp1=0,tomp=0,tomp1=0;
	for(i=0;i<dt;i++)
        {
            for(j=0;j<sta;j++)
            {
				if(i==0)
				{
					z[i][j]=0;
					z1[i][j]=0;
				}
				else
				{
					temp=0;
					tomp=0;
					for(k=0;k<n;k++)
					{
						temp+=x[k][i]*time[k][j]-w;
						tomp+=x1[k][i]*time[k][j]-w;
					}
					temp=temp+z[i-1][j];
					tomp=tomp+z1[i-1][j];
					temp1=length[j]-w;
					if(temp<temp1)
					{
						if(temp>0)
						{
							z[i][j]=temp;
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
						}
						else
						{
							z[i][j]=0;
						}
					}
					if(tomp<tomp1)
					{
						if(tomp>0)
						{
							z1[i][j]=tomp;
						}
						else
						{
							z1[i][j]=0;
						}
					}
					else
					{
						if(tomp1>0)
						{
							z1[i][j]=tomp1;
						}
						else
						{
							z1[i][j]=0;
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
	float temp=0,tomp=0;
	for(i=0;i<dt;i++)
	{
        for(j=0;j<sta;j++)
        {
			temp=0;
			tomp=0;
			for(k=0;k<n;k++)
			{
				temp+=x[k][i]*tme[k][j]-l[j];
				tomp+=x1[k][i]*tme[k][j]-l[j];
			}
			temp=temp+z[i][j];
			tomp=tomp+z1[i][j];
			if(temp>0)
			{
				u[i][j]=temp;
			}
			else
			{
				u[i][j]=0;
			}
			if(tomp>0)
			{
				u1[i][j]=tomp;
			}
			else
			{
				u1[i][j]=0;
			}
		}
	}			
}
//finding fitness value
void fitness_value(void)
{
    int i,j;
	float temp=0,tomp=0;
    for(j=0;j<sta;j++)
        {
			temp=0;
			tomp=0;
			for(i=0;i<dt;i++)
            {
				temp+=u[i][j];
				tomp+=u1[i][j];
			}
			fit[l]+=temp+z[dt][j];
			fit1[l]+=tomp+z1[dt][j];
        }
		
}

//changing the onlooker bee source according to the fitness
void onlooker_bee_phase(void)
{
    int j;
    for(l=0;l<sn;l++)
    {
        fit[l]=0,fit1[l]=0;
    }
    for(l=0;l<sn;l++)
    {
        sequence_matrix();
		start_pos();
		util_work();
        fitness_value();
        if(fit1[l]>fit[l])
        {
            for(j=0;j<dt;j++)
            {
                sol1[l][j]=sol[l][j];
            }
            fit1[l]=fit[l];
        }
        fitness_new+=1/(1+fit1[l]);
    }
}
void roulette_wheel(void)
{
    double pm;
    int i,j,k;
    for(i=0;i<sn;i++)
    {
        roule_prob[i]=(1/(1+fit1[i]))/fitness_new;
    }
     for(i=0;i<sn;i++)
    {
        for(j=0;j<=i;j++)
        {
            cumulativ_prob[i]+=roule_prob[j];
        }

    }

    for(i=0;i<sn;i++)
    {
        pm=(rand()%100)/100.0;
        for(k=0;k<sn;k++)
        {
            if(cumulativ_prob[0]>=pm && k==0 )
            {
            for(j=0;j<dt;j++)
			{
					sol[i][j]=sol1[i][j];

			}
			o++;
            }
            if(cumulativ_prob[k-1]<pm && cumulativ_prob[k]>=pm && k!=0)
            {
            for(j=0;j<dt;j++)
            {
                sol[i][j]=sol1[i][j];
            }
            o++;
            }
        }

    }
}
