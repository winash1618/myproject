# -*- coding: utf-8 -*-
"""
Created on Thu May 28 15:18:45 2020

@author: admin
"""

# -*- coding: utf-8 -*-
"""
Created on Sat May 23 13:47:59 2020

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
    
def setuptime(r,x,y):
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
    return d[x-1,y-1]                
    # return d

def nss(pi,x):
    #print(pi)
    d=random.randrange(1,10,1)
    a=d%3
    if a==0:
        #print(d)
        #print(pi)
        d=random.randrange(1,10,1)
        b=d%2
        if b==1:
            pi1=insertf(pi.copy(),x)
        else: 
            pi1=insertb(pi.copy(),x)
        #print(pi,d)
    elif a==1:
        pi1=swap(pi.copy(),x)
    elif a==2:
        d=random.randrange(1,10,1)
        b=d%2
        if b==1:
            pi1=insertf(pi.copy(),x)
            d=random.randrange(1,10,1)
            b=d%2
            if b==1:
                pi1=insertf(pi1.copy(),x)
                
            else: 
                pi1=insertb(pi1,x)
        else: 
            pi1=insertb(pi.copy(),x)
            d=random.randrange(1,10,1)
            b=d%2
            if b==1:
                pi1=insertf(pi1.copy(),x)
            else:   
                pi1=insertb(pi1.copy(),x)
    elif a==3:
        pi1=swap(pi.copy(),x)
        pi1=swap(pi1.copy(),x)
   # print (pi1)
    return pi1
                
def insertf(r,x):
    z=random.randrange(0,x-2,1)
    y=z+random.randrange(0,x-z-1,1)
    while z>=y:
        z=random.randrange(0,x-2,1)
        y=z+random.randrange(0,x-z-1,1)
    if z<y:
       for i in range(z,y-1):
            c=r[i]
            d=r[i+1]
            r[i]=d
            r[i+1]=c
    return r
def insertb(r,x):
    z=random.randrange(0,x-2,1)
    y=z+random.randrange(0,x-z-1,1)
    while z>=y:
        z=random.randrange(0,x-2,1)
        y=z+random.randrange(0,x-z-1,1)
    #print(z,y)
    #print(r)
    if z<y:
        for i in range(y,z+1,-1):
            #print(i,i-1)
            c=r[i]
            d=r[i-1]
            r[i]=d
            r[i-1]=c
    #print(r)
    
    return r
def swap(r,x):
    z=random.randrange(0,x-1,1)
    y=random.randrange(0,x-1,1)
    while z==y:
        z=random.randrange(0,x-1,1)
        y=random.randrange(0,x-1,1)
    if z!=y:
       	c=r[z]
        v=r[y]
        dd=r[c-1]
        gg=r[v-1]
        r[c-1]=gg
        r[v-1]=dd
    return r
def initialize(x):
    foo=[*range(1,x+1)]
    pie=np.zeros(s[q,1],dtype=int)
    #print(pie)
    i=0
    while len(foo)!=0:
        #print(foo)
        pie[i]=random.choice(foo)
        foo.remove(pie[i])
        i=i+1
    return pie
gu,gi=s.shape
q=1
while s[q,0]!=0:
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
    pie=initialize(x)
    ps=50
    iter=5000
    pls=0.8
    a=np.zeros((ps,x),dtype=int)
    a[0,:]=pie
    #print(a)
    for i in range(ps):
        z=random.randrange(0,x-1,1)
        yy=random.randrange(0,x-1,1)
        if z!=yy:
            c=pie[z]
            v=pie[yy]
            dd1=pie[c-1]
            gg=pie[v-1]
            pie[c-1]=gg
            pie[v-1]=dd1
        a[i,:]=pie
    pib=a[0,:]
    hii=np.zeros((1,iter),dtype=int)
    hi3=np.zeros((1,iter),dtype=int)
    ffo=1
    for j in range(iter):
        if j!=0:
            print(j, hi3[0,j-1],ffo)
        if ffo<1000:
            for i in range(ps):
                pi2=nss(a[i,:][:],x)
               # print(pi2)
                #print(a[i,:])
                hip=random.random()
                if hip<pls:
                    #print(hip)
                    if setuptime(pi2,x,y)<setuptime(a[i,:],x,y):
                        #print(hip)
                        #print(pi2)
                        a[i,:]=pi2
                        if setuptime(pi2,x,y)<setuptime(pib,x,y):
                            pib=pi2
                        else:
                            ffo=ffo+1
            #print(pib)            
            hii[0,j]=j
            hi3[0,j]=setuptime(pib,x,y)
        else:
            if (ffo==1000):
                pie=pib.copy()
                b=np.zeros((ps,x),dtype=int)
                b[0,:]=pie
                #print(a)
                for i in range(ps):
                    z=random.randrange(0,x-1,1)
                    yy=random.randrange(0,x-1,1)
                    if z!=yy:
                        c=pie[z]
                        v=pie[yy]
                        dd1=pie[c-1]
                        gg=pie[v-1]
                        pie[c-1]=gg
                        pie[v-1]=dd1
                    b[i,:]=pie
            ffo=ffo+1
            for i in range(ps):
                pi3=nss(b[i,:][:],x)
                   # print(pi2)
                #print(a[i,:])
                hip=random.random()
                if hip<pls:
                    #print(hip)
                    if setuptime(pi3,x,y)>setuptime(b[i,:],x,y):
                        #print(hip)
                        #print(pi2)
                        b[i,:]=pi3
                        if setuptime(pi3,x,y)==setuptime(pib,x,y):
                            pib=pi3
            #print(pib)            
            hii[0,j]=j
            hi3[0,j]=setuptime(pib,x,y)
    q=q+1
    plt.plot(hii[0,:],hi3[0,:])   
    
