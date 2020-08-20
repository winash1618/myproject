#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define sn 10
#define t 10000
#define n 5
#define dt 20
#define sta 15
#define w 13.1
#define n1 1
#define n2 0
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0,r=0,o=0;
float d[n]={4,4,4,4,4};
float length[sta]={15,8,8,9,10,14,16,17,18,10,9,15,11,14,18};
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
double tfit[2*sn],tfit1[2*sn],tfit2[2*sn],fit[sn],fit1[sn],pfit[sn],pfit1[sn],ufit[sn],ufit1[sn],roule_prob[sn],cumulativ_prob[sn],z[sta][dt],u[sta][dt],mat[sta];
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
		fit1[k]=10000000;
		ufit1[k]=10000000;
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
            printf("%d ",sol1[i][j]);
        }

    printf("               ");
    printf("%f,%f,%f",fit1[i],ufit1[i],pfit1[i]);
    printf("\n");

    }
    for(i=0;i<sn;i++)
    {
        printf("%f",fit1[i]);
        printf("\n");
    }
    printf("\n");
    for(i=0;i<sn;i++)
    {
        printf("%f",ufit1[i]);
        printf("\n");
    }
    printf("\n");
    for(i=0;i<sn;i++)
    {
        printf("%f",pfit1[i]);
        printf("\n");
    }
    printf("\n");
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
	int i,j=0,k,jj;
	for(i=0;i<2*sn;i++)
	{
        tfit2[i]=1;
        for(jj=0;jj<dt;jj++)
        {
            tsol[i][jj]=0;
        }
	}
    j=0;
	for(i=0;i<sn;i++)
	{
		tfit[i]=fit1[j];
		tfit1[i]=ufit1[j];
		for(jj=0;jj<dt;jj++)
		{
			tsol[i][jj]=sol1[i][jj];
		}
		j++;
	}
	j=0;
	for(i=sn;i<2*sn;i++)
	{
		tfit[i]=fit[j];
		tfit1[i]=ufit[j];
		for(jj=0;jj<dt;jj++)
		{
			tsol[i][jj]=sol[j][jj];
		}
		j++;
	}
	/*for(i=0;i<2*sn;i++)
	{
		for(j=0;j<2*sn;j++)
		{
            if(tfit[i]>tfit[j] && tfit1[i]>tfit1[j])
            {
                    tfit2[i]+=3;
            }
            else if(tfit[i]<=tfit[j] && tfit1[i]<=tfit1[j])
            {
                    tfit2[i]=tfit2[i];
            }
            else
            {
                    tfit2[i]+=1;
            }
        }
	}*/
	for(i=0;i<2*sn;i++)
	{
		for(j=0;j<2*sn;j++)
		{
             if( tfit1[i]>tfit1[j])
            {
                    tfit2[i]+=3;
            }
            else if(  tfit1[i]<=tfit1[j])
            {
                    tfit2[i]=tfit2[i];
            }
            else
            {
                    tfit2[i]+=1;
            }
        }
	}
	for(i=0;i<sn;i++)
	{
		j=0;
		k=j+1;
		while(k<2*sn)
		{
			if(tfit2[j]<=tfit2[k])
			{
				k++;
			}
			else
			{
				j=k;
				k=j+1;
			}
		}
		fit1[i]=tfit[j];
		ufit1[i]=tfit1[j];
		pfit1[i]=tfit2[j];
		tfit2[j]=20000;
		for(jj=0;jj<dt;jj++)
		{
			sol1[i][jj]=tsol[j][jj];
			sol[i][jj]=tsol[j][jj];
		}
		fitness_new+=1/(1+pfit1[l]);
	}
    for(i=0;i<2*sn;i++)
	{
	   tfit2[i]=1;
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
        roule_prob[i]=(1/(1+pfit1[i]))/fitness_new;
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
