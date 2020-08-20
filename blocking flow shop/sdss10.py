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
gu,gi=s.shape
q=1
pp=np.zeros((s[q,1]+1,s[q,2]), dtype='int64')
kk=np.zeros((s[q,1]+1,s[q,1]+1,s[q,2]), dtype='int64')
ggo=s[q,0]
gge=s[q,0]
generate_flow_shop(q)
generate_ssd(q)
kk=np.zeros((s[q,1]+1,s[q,1]+1,s[q,2]), dtype='int64')
#print(ssd)
#print(pp)
x=s[q,1]
y=s[q,2]  
r=np.array([15, 12,  1, 13,  5,  8, 18,  6, 20,  3, 11, 19,  4, 17, 10,  7,  9,
        2, 16, 14])
sf=np.zeros(x, dtype=int)  
f=np.zeros((x,y), dtype=int)
for i in range(x-1,0-1,-1):
    pt=pp[r[i],:] 
    if i==x-1:
        sf[i]=0
    else:
        sf[i]=f[i+1,y-1]+kk[r[i],r[i+1],y-1]
    for j in range(y-1,0-1,-1):
        if i==x-1:
            if j==y-1:
                f[i,j]=sf[i]+pt[j]
            else:
                f[i,j]=f[i,j+1]+pt[j]
        else:
            if j==y-1:
                if sf[i]+pt[j]>f[i+1,j-1]+kk[r[i],r[i+1],j]:
                    f[i,j]=sf[i]+pt[j]
                else:
                    f[i,j]=f[i+1,j-1]+kk[r[i],r[i+1],j]
            elif j>0:
                if f[i+1,j-1]+kk[r[i],r[i+1],j]>f[i,j+1]+pt[j]:
                    f[i,j]=f[i+1,j-1]+kk[r[i],r[i+1],j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            else:
                f[i,j]=f[i,j+1]+pt[j]
print(f,sf)        