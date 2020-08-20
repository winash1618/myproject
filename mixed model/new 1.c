#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include <math.h>
#define sn 10
#define t 1000
#define n 3
#define dt 4
int i=0,j=0,k=0,c,sum=0,sum1=0,l=0,m=0;
float d[n]={1,1,2};
double fit[sn],fit1[sn],roule_prob[sn],cumulativ_prob[sn];
double rand_num,prob=0.02,fitness=0,fitness_new=0;
int y[n][dt],x[n][dt],sol[sn][dt],sol1[sn][dt],x1[n][dt],s[n][dt],s1[n][dt];
void initialization_phase(void);
void y_to_sequence(void);
void employed_bee_phase(void);
void onlooker_bee_phase(void);
void sequence_matrix(void);
void cumulative_matrix(void);
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
            printf("%d",sol1[i][j]);
        }

    printf("               ");
    printf("%f",(fit1[i]));
    printf("\n");
    }
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
    int i,j,temp=0,k1,k2;
    float p;
    //printf("%f",prob);
    for(i=0;i<sn;i++)
    {
        for(j=0;j<dt;j++)
        {
            k1=rand()%dt;
            k2=rand()%dt;
            p=(rand()%100+1);
            if( p < prob*100 && k1!=k2)
            {
                temp=sol[i][k1];
                sol[i][k1]=sol[i][k2];
                sol[i][k2]=temp;
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
//finding cumulative matrix
void cumulative_matrix(void)
{
    int i,k,j;
    for(i=0;i<n;i++)
    {
        for(j=0;j<dt;j++)
        {
            s[i][j]=0;
            s1[i][j]=0;
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
			if(i==0)
            {
                if(x1[k][i]==1)
                {
                    s1[k][i]+=1;
                }
                else
                {
                    s1[k][i]=0;
                }
            }
            else
            {
                if(x1[k][i]==1)
                {
                    s1[k][i]=s1[k][i-1]+1;
                }
                else
                {
                    s1[k][i]=s1[k][i-1];
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
                fit[l]+=((s[i][j]-((j+1)*d[i])/dt)*(s[i][j]-((j+1)*d[i])/dt));
                fit1[l]+=((s1[i][j]-((j+1)*d[i])/dt)*(s1[i][j]-((j+1)*d[i])/dt));
            }
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
        cumulative_matrix();
        fitness_value();
        if(fit1[l]>fit[l])
        {
            for(j=0;j<dt;j++)
            {
                sol1[l][j]=sol[l][j];
            }
            fit1[l]=fit[l];
        }
        fitness_new+=fit1[l];
    }
}
void roulette_wheel(void)
{
    double pm;
    int i=0;
    for(i=0;i<sn;i++)
    {
        roule_prob[i]=fit1[i]/fitness_new;
        cumulativ_prob[i]+=roule_prob[i];
    }
    for(i=0;i<sn;i++)
    {
        pm=(rand()%100)/100;
        if(cumulativ_prob[0]>pm)
        {
            for(j=0;j<dt;j++)
			{
					sol[i][j]=sol1[i][j];
			}
        }
        if(cumulativ_prob[i-1]<pm && cumulativ_prob[i]>pm && i!=0)
        {
            for(j=0;j<dt;j++)
            {
                sol[i][j]=sol1[i][j];
            }
        }
    }
}
