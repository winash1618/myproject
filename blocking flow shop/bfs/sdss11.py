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
        sf[i]=f[i+1,y-1]
    for j in range(y-1,0-1,-1):
        if i==x-1:
            if j==y-1:
                f[i,j]=sf[i]+pt[j]
            else:
                f[i,j]=f[i,j+1]+pt[j]
                # print(f[i,j],j,f[i,j+1],pt)
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
print(f,sf)        