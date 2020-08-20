# -*- coding: utf-8 -*-
"""
Created on Sat May 30 07:28:41 2020

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
pp=np.array([[0,0,0],
             [1,3,2],
             [1,2,1],
             [3,2,1]])
kk=np.array([[[0,2,1,4],[0,0,1,2],[0,3,0,4],[0,2,2,0]],
             [[0,1,2,3],[0,0,3,1],[0,4,0,2],[0,3,4,0]],
             [[0,2,3,3],[0,0,1,4],[0,1,0,1],[0,2,3,0]]
             ])
x=3
y=3  
r=np.array([2,1,3])
sf=np.zeros(x, dtype=int)  
f=np.zeros((x,y), dtype=int)
for i in range(x-1,0-1,-1):
    pt=pp[r[i],:] 
    if i==x-1:
        sf[i]=0
    else:
        sf[i]=f[i+1,y-1]+kk[y-1,r[i],r[i+1]]
    for j in range(y-1,0-1,-1):
        if i==x-1:
            if j==y-1:
                f[i,j]=sf[i]+pt[j]
            else:
                f[i,j]=f[i,j+1]+pt[j]
        else:
            if j==y-1:
                if sf[i]+pt[j]>f[i+1,j-1]:
                    f[i,j]=sf[i]+pt[j]+kk[j,r[i],r[i+1]]
                else:
                    f[i,j]=f[i+1,j-1]
            elif j>0:
                if f[i+1,j-1]+kk[r[i],r[i+1],j]>f[i,j+1]+pt[j]:
                    f[i,j]=f[i+1,j-1]
                else:
                    f[i,j]=f[i,j+1]+pt[j]+kk[j,r[i],r[i+1]]
            else:
                f[i,j]=f[i,j+1]+pt[j]
print(f,sf)        
ss=np.zeros(x+1, dtype=int)
d=np.zeros((x+1,y), dtype=int)
for i in range(x+1): 
    if i==0:
        pt=pp[0,:] 
    else:
        pt=pp[r[i-1],:]
    if i==0:
        ss[i]=0    
    elif i==1:
        print(kk[0,r[i-2],r[i-1]] ,r[i-2],r[i-1],i)
        ss[i]=d[i-1,0]+kk[0,0,r[i-1]]  
    else:
        print(kk[0,r[i-2],r[i-1]] ,r[i-2],r[i-1],i)
        ss[i]=d[i-1,0]+kk[0,r[i-2],r[i-1]]  
    for j in range(y):
        if i==0:
             if j==0:
                d[i,j]=ss[i]+pt[j]
             else:
                d[i,j]=d[i,j-1]+pt[j]
        elif i==1:
            if j==0:
                if (ss[i]+pt[j])>(d[i-1,j+1]+kk[j+1,0,r[i-1]]):
                    d[i,j]=ss[i]+pt[j]
                else:
                    d[i,j]=d[i-1,j+1]+kk[j+1,0,r[i-1]]
            elif j < y-1:
                if d[i,j-1]+pt[j]>d[i-1,j+1]+kk[j+1,0,r[i-1]]:
                    d[i,j]=d[i,j-1]+pt[j]
                else:
                    d[i,j]=d[i-1,j+1]+kk[j+1,0,r[i-1]]
            else:
                d[i,j]=d[i,j-1]+pt[j]
        else:
            if j==0:
                if (ss[i]+pt[j])>(d[i-1,j+1]+kk[j+1,r[i-2],r[i-1]]):
                    d[i,j]=ss[i]+pt[j]
                else:
                    print(d[i-1,j+1],kk[j+1,r[i-2],r[i-1]])
                    d[i,j]=d[i-1,j+1]+kk[j+1,r[i-2],r[i-1]]
            elif j < y-1:
                if d[i,j-1]+pt[j]>d[i-1,j+1]+kk[j+1,r[i-2],r[i-1]]:
                    d[i,j]=d[i,j-1]+pt[j]
                else:
                    d[i,j]=d[i-1,j+1]+kk[j+1,r[i-2],r[i-1]]
            else:
                d[i,j]=d[i,j-1]+pt[j]
print(d,ss)