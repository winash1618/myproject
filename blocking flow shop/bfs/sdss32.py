# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 23:41:37 2020

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
pp=np.array([[ 0,  0,  0,  0,  0],
       [54, 79, 16, 66, 58],
       [83,  3, 89, 58, 56],
       [15, 11, 49, 31, 20],
       [71, 99, 15, 68, 85],
       [77, 56, 89, 78, 53],
       [36, 70, 45, 91, 35],
       [53, 99, 60, 13, 53],
       [38, 60, 23, 59, 41],
       [27,  5, 57, 49, 69],
       [87, 56, 64, 85, 13],
       [76,  3,  7, 85, 86],
       [91, 61,  1,  9, 72],
       [14, 73, 63, 39,  8],
       [29, 75, 41, 41, 49],
       [12, 47, 63, 56, 47],
       [77, 14, 47, 40, 87],
       [32, 21, 26, 54, 58],
       [87, 86, 75, 77, 18],
       [68,  5, 77, 51, 68],
       [94, 77, 40, 31, 28]])
x=20
y=5 
r=np.array([3,17,9,14,11,6,5,18,4,10,7,12,19,15,8,16,1,2,13,20])

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
num=9
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
        if ss2[hero]+pj[j]>d2[hero-1,j+1]:
            print(d3)
            d3[j]=ss2[hero]+pj[j]
        else:
            
            d3[j]=d2[hero-1,j+1]   
            print(d3)
    elif j<y-1:
        if d3[j-1]+pj[j]>d2[hero-1,j+1]:
            d3[j]=d3[j-1]+pj[j]
            print(d3,d3[j-1],pj[j])
        else:
            d3[j]=d2[hero-1,j+1]
    else:
        d3[j]=d3[j-1]+pj[j]
    

    cmax[j]=d3[j]+f2[hero,j]
print(d3)
pi5=np.insert(pi5,hero,num)
print(pi5,cmax)
print(setuptime1(pi5,x,y))





 