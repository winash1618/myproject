

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
            [26, 59, 78, 88, 69],
            [38, 62, 90, 54, 30],
            [27, 44, 64, 47, 61],
            [88, 10, 49, 83, 35],
            [95, 23, 47, 84, 53],
            [55, 64, 20,  9, 98],
            [54, 47, 61, 30, 94],
            [63, 68, 93, 11, 33],
            [23, 54, 36, 92, 77],
            [45,  9, 47, 63, 31],
            [86, 30, 70, 62, 54],
            [43, 31, 54, 75, 71],
            [43, 92, 87, 48, 78],
            [40,  7, 13, 23,  9],
            [37, 14, 40, 85, 79],
            [54, 95, 34, 23, 51],
            [35, 76, 55,  4, 76],
            [59, 82, 13, 31, 56],
            [43, 91, 11, 13, 80],
            [50, 37,  5, 98, 72]])
x=20
y=5 
r=np.array([15, 12,  1, 13,  5,  8, 18,  6, 20,  3, 11, 19,  4, 17, 10,  7,  9,
        2, 16, 14])

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





 