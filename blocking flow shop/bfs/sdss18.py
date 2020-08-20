# -*- coding: utf-8 -*-
"""
Created on Sat May 30 07:00:13 2020

@author: admin
"""



# -*- coding: utf-8 -*-
"""
Created on Fri May 29 07:42:07 2020

@author: admin
"""

# -*- coding: utf-8 -*-
"""
Created on Thu May 28 21:52:12 2020

@author: admin
"""
import os
import matplotlib.pyplot as plt
from scipy.io import loadmat
import numpy as np
import random
import math
os.chdir('F:\scilab\manyu')
s =np.array( [
  [         0,  0, 0],
  [ 379008056, 20, 5],
  [         0,  0, 0]])
def unif(seed,low,high):
    
    m = 2147483647
    a = 16807
    b = 127773
    c = 2836
    k=int(seed/b)
    seed=a*(seed%b)-k*c
    if seed<0:
        seed=seed+m
    ff=seed/m
    #print(k,seed)
    fir=low+math.floor(ff*(high -low +1))
    return(seed,fir)

def generate_flow_shop(q):
    global gge
    for i in range(s[q,2]):
        for j in range(1,s[q,1]+1):
            gge,pp[j,i]=unif(gge,1,99)
            
def generate_ssd(q):
    global ggo
    for i in range(s[q,2]):
        for j in range(1,s[q,1]+1):
            for k in range(1,s[q,1]+1):
                if j==k:
                    kk[j,k,i]=0
                else:
                    ggo,kk[j,k,i]=unif(ggo,1,99)    


def setuptime1(r,x,y):
    ss=np.zeros(x, dtype=int)
    d=np.zeros((x,y), dtype=int)
    for i in range(x):
        pt=pp[r[i],:] 
        if i==0:
             ss[i]=0        
        else:
             ss[i]=d[i-1,0]
        for j in range(y):
            if i==0:
                 if j==0:
                    d[i,j]=ss[i]+pt[j]
                 else:
                    d[i,j]=d[i,j-1]+pt[j]
            else:
                if j==0:
                    if (ss[i]+pt[j]+kk[r[i-1],r[i],j])>(d[i-1,j+1]):
                        d[i,j]=ss[i]+pt[j]+kk[r[i-1],r[i],j]
                    else:
                        d[i,j]=d[i-1,j+1]
                elif j < y-1:
                    if d[i,j-1]+pt[j]+kk[r[i-1],r[i],j]>d[i-1,j+1]:
                        d[i,j]=d[i,j-1]+pt[j]+kk[r[i-1],r[i],j]
                    else:
                        d[i,j]=d[i-1,j+1]
                else:
                    d[i,j]=d[i,j-1]+pt[j]+kk[r[i-1],r[i],j]
   # print(d,ss)
    return d,ss                
    # return d
def tailtime(r,x,y):
    sf=np.zeros(x, dtype=int)  
    f=np.zeros((x,y), dtype=int)
    for i in range(x-1,0-1,-1):
        pt=pp[r[i],:] 
        if i==x-1:
            sf[i]=0
        else:
            sf[i]=f[i+1,y-1]
        for j in range(y-1,0-1,-1):
            if i==x-1:
                if j==y-1:
                    f[i,j]=sf[i]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            else:
                if j==y-1:
                    if sf[i]+pt[j]>f[i+1,j-1]:
                        f[i,j]=sf[i]+pt[j]
                    else:
                        f[i,j]=f[i+1,j-1]
                elif j>0:
                    if f[i+1,j-1]>f[i,j+1]+pt[j]:
                        f[i,j]=f[i+1,j-1]
                    else:
                        f[i,j]=f[i,j+1]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
    return f,sf
gu,gi=s.shape
q=1
pp=np.zeros((s[q,1]+1,s[q,2]), dtype='int64')
kk=np.zeros((s[q,1]+1,s[q,1]+1,s[q,2]), dtype='int64')
ggo=s[q,0]
gge=s[q,0]
generate_flow_shop(q)
generate_ssd(q)
# kk=np.zeros((s[q,1]+1,s[q,1]+1,s[q,2]), dtype='int64')
#print(ssd)
#print(pp)
x=s[q,1]
y=s[q,2] 
r=np.array([15, 12,  1, 13,  5,  8, 18,  6, 20,  3, 11, 19,  4, 17, 10,  7,  9,
        2, 16, 14])
pi4=r.copy()
d1,ss1=setuptime1(pi4,x,y)
f1,sf1=tailtime(pi4,x,y)
num=1
pj=pp[num,:]
here=np.where(pi4==num)
pi5=np.delete(pi4,here)
hero=2
ss2=np.zeros(x-1, dtype=int)
sf2=np.zeros(x-1, dtype=int)
d2=np.zeros((x-1,y), dtype=int)
f2=np.zeros((x-1,y), dtype=int)
d2,ss2=setuptime1(pi5,x-1,y)
f2,sf2=tailtime(pi5,x-1,y)
d3=np.zeros(y, dtype=int)
cmax=np.zeros((y), dtype=int)
for j in range(y):
    if j==0:
        if ss2[hero]+pj[j]+kk[pi5[hero-1],hero,j]>d2[hero-1,j+1]:
            print(d3)
            d3[j]=ss2[hero]+pj[j]+kk[pi5[hero-1],hero,j]
        else:
            
            d3[j]=d2[hero-1,j+1]   
            print(d3)
    elif j<y-1:
        if d3[j-1]+pj[j]+kk[pi5[hero-1],hero,j]>d2[hero-1,j+1]:
            d3[j]=d3[j-1]+pj[j]+kk[pi5[hero-1],hero,j]
            print(d3,d3[j-1],pj[j])
        else:
            d3[j]=d2[hero-1,j+1]
    else:
        d3[j]=d3[j-1]+pj[j]+kk[pi5[hero-1],hero,j]
    

    cmax[j]=d3[j]+f2[hero,j]
print(d3)
pi5=np.insert(pi5,hero,num)
print(pi5,cmax)
print(setuptime1(pi5,x,y))





 