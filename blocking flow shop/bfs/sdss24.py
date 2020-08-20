# -*- coding: utf-8 -*-
"""
Created on Sat May 30 17:35:35 2020

@author: admin
"""

# -*- coding: utf-8 -*-
"""
Created on Sat May 30 07:16:08 2020

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
                    kk[i,j,k]=0
                else:
                    ggo,kk[i,j,k]=unif(ggo,1,9)    
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
r=np.array([15,  3,  2, 16, 6,  20,  1, 13,  18,  11,  19, 4,  7, 9, 5, 17, 12,
       10,  8, 14])
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
            
print(f,sf)        
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
print(d,ss)