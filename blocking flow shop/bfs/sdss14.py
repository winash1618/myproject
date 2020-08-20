# -*- coding: utf-8 -*-
"""
Created on Fri May 29 16:56:01 2020

@author: admin
"""

# -*- coding: utf-8 -*-
"""
Created on Fri May 29 15:05:22 2020

@author: admin
"""

# -*- coding: utf-8 -*-
"""
Created on Fri May 29 14:24:41 2020

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
             [3,2,1],
             [1,2,1],
             [3,2,1]])
x=5
y=3  
r=np.array([2,1,3,5,4])

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
def tailtime1(r,f,sf,i,y):
    pt=pp[r[i],:] 
    if i==x-2:
        sf[i]=0
    else:
        
        sf[i]=f[i+1,y-1]
    # print(f)
    for j in range(y-1,0-1,-1):
        if i==x-2:
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
                    if (ss[i]+pt[j])>(d[i-1,j+1]):
                        d[i,j]=ss[i]+pt[j]
                    else:
                        d[i,j]=d[i-1,j+1]
                elif j < y-1:
                    if d[i,j-1]+pt[j]>d[i-1,j+1]:
                        d[i,j]=d[i,j-1]+pt[j]
                    else:
                        d[i,j]=d[i-1,j+1]
                else:
                    d[i,j]=d[i,j-1]+pt[j]
   # print(d,ss)
    return d,ss             
    # return d
def setuptime2(r,d,ss,i,y):
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
                if (ss[i]+pt[j])>(d[i-1,j+1]):
                    d[i,j]=ss[i]+pt[j]
                else:
                    d[i,j]=d[i-1,j+1]
            elif j < y-1:
                if d[i,j-1]+pt[j]>d[i-1,j+1]:
                    d[i,j]=d[i,j-1]+pt[j]
                else:
                    d[i,j]=d[i-1,j+1]
            else:
                d[i,j]=d[i,j-1]+pt[j]
   # print(d,ss)
    return d,ss              
    # return d
pi4=r.copy()
d1,ss1=setuptime1(pi4,x,y)
f1,sf1=tailtime(pi4,x,y)
print(r,d1)
num=5
pj=pp[num,:]
here=np.where(pi4==num)
pi5=np.delete(pi4,here)
hero=1
ss2=np.zeros(x-1, dtype=int)
sf2=np.zeros(x-1, dtype=int)
d2=np.zeros((x-1,y), dtype=int)
f2=np.zeros((x-1,y), dtype=int)
for i in range(x-1):
    if i<here[0]:
        d2[i,:]=d1[i,:]
        ss2[i]=ss1[i]
    else:
        d2,ss2=setuptime2(pi5,d2,ss2,i,y)
for i in range(x-2,-1,-1):
    if i>here[0]:
        f2[i,:]=f1[i,:]
        sf2[i]=sf1[i]
    else:
        f2,sf2=tailtime1(pi5,f2,sf2,i,y)
print(d2,f2)
cmax=np.zeros((y), dtype=int)
if hero!=here[0] :
    for j in range(y):
        cmax[j]=d2[hero-1,j]+f2[hero,j]
pi5=np.insert(pi5,hero,num)
print(pi5,cmax)
print(setuptime1(pi5,x,y))





 