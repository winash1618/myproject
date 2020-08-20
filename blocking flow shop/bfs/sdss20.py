# -*- coding: utf-8 -*-
"""
Created on Sat May 30 07:56:32 2020

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
                    ggo,kk[i,j,k]=unif(ggo,1,99)    
gu,gi=s.shape
q=1
pp=np.zeros((s[q,1]+1,s[q,2]), dtype='int64')
kk=np.zeros((s[q,2],s[q,1]+1,s[q,1]+1), dtype='int64')
ggo=s[q,0]
gge=s[q,0]
generate_flow_shop(q)
generate_ssd(q)