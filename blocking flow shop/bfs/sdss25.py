# -*- coding: utf-8 -*-
"""
Created on Sat May 30 17:39:16 2020

@author: admin
"""

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
  [ 873654221,    20,  5],
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
                    kk[i,j,k]=0
                else:
                    ggo,kk[i,j,k]=unif(ggo,1,9)     


def setuptime1(r,x,y):
    ss=np.zeros(x, dtype=int)
    d=np.zeros((x,y), dtype=int)
    for i in range(x): 
        pt=pp[r[i],:]   
        if i==0:
            ss[i]=kk[0,0,r[i]]  
        else:
            ss[i]=d[i-1,0]+kk[0,r[i-1],r[i]]  
        for j in range(y):
            if i==0:
                if j==0:
                    if (ss[i]+pt[j])>kk[j+1,0,r[i]]:
                        d[i,j]=ss[i]+pt[j]
                    else:
                        d[i,j]=kk[j+1,0,r[i]]
                elif j < y-1:
                    if d[i,j-1]+pt[j]>kk[j+1,0,r[i]]:
                        d[i,j]=d[i,j-1]+pt[j]
                    else:
                        d[i,j]=kk[j+1,0,r[i]]
                else:
                    d[i,j]=d[i,j-1]+pt[j]
            else:
                if j==0:
                    if (ss[i]+pt[j])>(d[i-1,j+1]+kk[j+1,r[i-1],r[i]]):
                        d[i,j]=ss[i]+pt[j]
                    else:
                        d[i,j]=d[i-1,j+1]+kk[j+1,r[i-1],r[i]]
                elif j < y-1:
                    if d[i,j-1]+pt[j]>d[i-1,j+1]+kk[j+1,r[i-1],r[i]]:
                        d[i,j]=d[i,j-1]+pt[j]
                    else:
                        d[i,j]=d[i-1,j+1]+kk[j+1,r[i-1],r[i]]
                else:
                    d[i,j]=d[i,j-1]+pt[j]
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
        elif i>0:
            sf[i]=f[i+1,y-1]+kk[y-1,r[i],r[i+1]]
        else:
            sf[i]=f[i+1,y-1]+kk[y-1,r[i],r[i+1]]
        for j in range(y-1,0-1,-1):
            if i==x-1:
                if j==y-1:
                    f[i,j]=sf[i]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            elif i>0:
                if j==y-1:
                    if sf[i]+pt[j]>f[i+1,j-1]+kk[j-1,r[i],r[i+1]]:
                        
                        f[i,j]=sf[i]+pt[j]
                    else:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                elif j>0:
                    if f[i+1,j-1]+kk[j-1,r[i],r[i+1]]>f[i,j+1]+pt[j]:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                    else:
                        f[i,j]=f[i,j+1]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            else:
                if j==y-1:
                    if sf[i]+pt[j]>f[i+1,j-1]+kk[j-1,r[i],r[i+1]]:
                        f[i,j]=sf[i]+pt[j]
                    else:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                elif j>0:
                    if f[i+1,j-1]+kk[j-1,r[i],r[i+1]]>f[i,j+1]+pt[j]:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                    else:
                        f[i,j]=f[i,j+1]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
    print(f.shape)       
    return f,sf
gu,gi=s.shape
q=1
pp=np.zeros((s[q,1]+1,s[q,2]), dtype='int64')
kk=np.zeros((s[q,2],s[q,1]+1,s[q,1]+1), dtype='int64')
ggo=s[q,0]
gge=s[q,0]
generate_flow_shop(q)
generate_ssd(q)
# kk=np.zeros((s[q,1]+1,s[q,1]+1,s[q,2]), dtype='int64')
#print(ssd)
#print(pp)
x=s[q,1]
y=s[q,2] 
r=np.array([ 3,17,9,8,19,14,16,6,5,1,18,4,10,7,12,11,15,2,13,20])
pi4=r.copy()
d1,ss1=setuptime1(pi4,x,y)
f1,sf1=tailtime(pi4,x,y)
num=17
pj=pp[num,:]
here=np.where(pi4==num)
pi5=np.delete(pi4,here)
hero=1
ss2=np.zeros(x-1, dtype=int)
sf2=np.zeros(x-1, dtype=int)
d2=np.zeros((x-1,y), dtype=int)
f2=np.zeros((x-1,y), dtype=int)
d2,ss2=setuptime1(pi5,x-1,y)
f2,sf2=tailtime(pi5,x-1,y)
d3=np.zeros(y, dtype=int)
cmax=np.zeros((y), dtype=int)
print(d2[hero-1],f2[hero],pj,ss2[13])
for j in range(y):
    if hero==0:
        if j==0:
            if (ss2[hero]+pj[j])>kk[j+1,0,r[hero]]:
                d3[j]=ss2[hero]+pj[j]
            else:
                d3[j]=kk[j+1,0,r[hero]]
        elif j < y-1:
            if d3[j-1]+pj[j]>kk[j+1,0,r[hero]]:
                d3[j]=d3[j-1]+pj[j]
            else:
                d3[j]=kk[j+1,0,r[hero]]
        else:
            d3[j]=d3[j-1]+pj[j]
    elif hero<x-1:
        if j==0:
            if (ss2[hero]+pj[j])>(d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]):
                d3[j]=ss2[hero]+pj[j]
            else:
                d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]
        elif j < y-1:
            if d3[j-1]+pj[j]>d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]:
                d3[j]=d3[j-1]+pj[j]
            else:
                d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]
        else:
            d3[j]=d3[j-1]+pj[j]
    else:
        ss20=d2[hero-1,0]+kk[0,r[hero-1],r[hero]]  
        if j==0:
            if (ss20+pj[j])>(d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]):
                d3[j]=ss20+pj[j]
            else:
                d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]
        elif j < y-1:
            if d3[j-1]+pj[j]>d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]:
                d3[j]=d3[j-1]+pj[j]
            else:
                d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],r[hero]]
        else:
            d3[j]=d3[j-1]+pj[j]
    if hero<x-1:
        cmax[j]=d3[j]+f2[hero,j]+kk[j,r[hero],r[hero+1]]
    else:
        cmax[j]=d3[j]
print(d3)
pi6=np.insert(pi5,hero,num)
print(pi5,cmax)
print(setuptime1(pi6,x,y),tailtime(pi6,x,y),pi6,x,y)





 