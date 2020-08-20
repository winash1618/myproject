#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define sn 10
#define t  2000
#define n 15
#define dt 100
#define sta 15
#define w 8.1
#define n1 1
#define n2 0
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0,r=0,o=0;
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
double fit[sn],pfit[sn],ufit[sn],roule_prob[sn],cumulativ_prob[sn],z[sta][dt],u[sta][dt],mat[sta];
double rand_num,fitness=0,fitness_new=0;
int y[n][dt],x[n][dt],sol[sn][dt],tsol[2*sn][dt],sol1[sn][dt],s[n][dt];
void initialization_phase(void);
void y_to_sequence(void);
void employed_bee_phase(void);
void onlooker_bee_phase(void);
void sequence_matrix(void);
void util_work(void);
void start_pos(void);
void fitness_value_prv(void);
void cumulative_matrix(void);
void fitness_value_utility(void);
void roulette_wheel(void);
void fitness_value_pareto(void);
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
            //printf("a");
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
            printf("%d,",sol[i][j]);
        }

    printf("               ");
    printf("%f,%f,%f",fit[i],ufit[i],pfit[i]);
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
        }
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
					z[j][i]=0;
				}
				else
				{
					temp=0;
					for(k=0;k<n;k++)
					{
						temp+=x[k][i-1]*tme[j][k];
					}
					temp=temp+z[j][i-1]-w;
					temp1=length[j]-w;
					if(temp<temp1)
					{
						if(temp>0)
						{
							z[j][i]=temp;
						}
						else
						{
							z[j][i]=0;
						}
					}
					else
					{
						if(temp1>0)
						{
							z[j][i]=temp1;
						}
						else
						{
							z[j][i]=0;
						}
					}
				}
			}
		}
		else
        {
            for(j=0;j<sta;j++)
            {
                temp=0;
                for(k=0;k<n;k++)
				{
					temp+=x[k][i-1]*tme[j][k];
				}
                temp=temp+z[j][dt-1]-w;
				temp1=length[j]-w;
				if(temp<temp1)
				{
					if(temp>0)
					{
						mat[j]=temp;
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
				temp+=x[k][i]*tme[j][k];
			}
			temp=temp+z[j][i]-length[j];
			if(temp>0)
			{
				u[j][i]=temp;
			}
			else
			{
				u[j][i]=0;
			}
		}
	}
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
void fitness_value_utility(void)
{
    int i,j;
	float temp=0;
    for(j=0;j<sta;j++)
	{
		temp=0;
        for(i=0;i<dt;i++)
        {
			temp+=u[j][i];
		}
		ufit[l]+=(temp+mat[j]);
	}
}
void fitness_value_prv(void)
{
    int i,j;
    for(i=0;i<n;i++)
        {
            for(j=0;j<dt;j++)
            {
                fit[l]+=((s[i][j]-((j+1)*d[i])/dt)*(s[i][j]-((j+1)*d[i])/dt));
            }
        }
}
void fitness_value_pareto(void)
{
	int i,j=0;
	for(i=0;i<sn;i++)
	{
		for(j=0;j<sn;j++)
		{
            if(fit[i]<fit[j] &&  ufit[i]<ufit[j])
            {
                    pfit[i]+=1;
            }
            if(fit[i]>fit[j] &&  ufit[i]<ufit[j])
            {
                    pfit[i]+=1;
            }
            if(fit[i]>fit[j] &&  ufit[i]>ufit[j])
            {
                    pfit[i]+=1;
            }

        }
		fitness_new+=1/(1+pfit[i]);
	}
}
//changing the onlooker bee source according to the fitness
void onlooker_bee_phase(void)
{
    int j;
    for(l=0;l<sn;l++)
    {
		ufit[l]=0;
		pfit[l]=1;
        fit[l]=0;
    }
    for(l=0;l<sn;l++)
    {
        sequence_matrix();
		start_pos();
		util_work();
		cumulative_matrix();
        fitness_value_utility();
		fitness_value_prv();
    }
	fitness_value_pareto();

}
void roulette_wheel(void)
{
    double pm;
    int i,j,k;
    for(i=0;i<sn;i++)
    {
        roule_prob[i]=(1/(1+pfit[i]))/fitness_new;
    }
     for(i=0;i<sn;i++)
    {
        for(j=0;j<=i;j++)
        {
            cumulativ_prob[i]+=roule_prob[j];
            printf("%f ",cumulativ_prob[i]);
        }
        printf("\n");
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
