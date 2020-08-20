# -*- coding: utf-8 -*-
"""
Created on Wed May 27 14:18:45 2020

@author: admin
"""

# -*- coding: utf-8 -*-
"""
Created on Tue May 26 18:17:40 2020

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
  [28837162,    500, 20],
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
    if z!=y:
       	c=r[z]
        v=r[y]
        dd=r[c-1]
        gg=r[v-1]
        r[c-1]=gg
        r[v-1]=dd
    return r
def rz(x,y):
    rei=pft1(x,y)
    make=100000
    for i in range (x):
        gta=np.zeros(x,dtype=int)
        gta[0]=rei[i]
        gta=pft2(x,y,gta)
        gta=gta[::-1]
        # print(gta,rei[i])
        gg=gta[i]
        for j in range(x):
            # print(gta)
            gta[i]=0
            if gta[j]!=0:
                gta[i]=gta[j]
                gta[j]=gg
                gg=gta[i]
                jug=setuptime(gta,x,y)
                # print(jug,gta[i],gta[j],gta)
                if jug<make:
                    hurray=gta
                    make=jug.copy()
                    
                else:
                    gg=gta[j]
                    gta[j]=gta[i]
                    gta[i]=gg
        print (i,hurray)
    return hurray     
def pft2(x,y,gta):
    foo=[*range(1,x+1)]
    foo.remove(gta[0])
    dp=np.zeros(y,dtype=int)
    dp=dprtime(dp,gta[0],y)
    k=1
    while len(foo)!=0:
        mino=909009
        if k!=1:
            dp=mij.copy()
        fin=dp.copy()
        for i in foo:
            dp=dprtime(dp,i,y)
            # print(dp)
            ffi=sum(dp)-sum(fin)-sum(pp[i,:])
            six=(len(foo)-2)*ffi+dp[y-1]
            if six<mino:
                tempo=i
                mino=six.copy()
                mij=dp.copy()
            dp=fin.copy()
            
        gta[k]=tempo
        print(len(foo))
        foo.remove(gta[k])
        k=k+1
    return gta      
def dprtime(dp,go,y):
    py=pp[go,:]
    for i in range(y):
        if i==0:
            dp[i]=dp[i]+py[i]
        elif i<y-1:
            if dp[i]+py[i]>dp[i+1]:
                dp[i]=dp[i]+py[i]
            else:
                dp[i]=dp[i+1]
        else:
            dp[i]=dp[i]+py[i]
    return dp
def pft1(x,y):
    guy=np.zeros(x,dtype=int)
    guy1=np.zeros(x,dtype=int)
    for i in range(1,x+1):
        for j in range(y):
            guy[i-1]=(y-j)*pp[i,j]*(2/y)+pp[i,j]
    buy=np.sort(guy)
    for i in range(x):
        for j in range(x):
            if buy[i]==guy[j]:
                guy1[i]=j+1
                guy[j]=0
                break
    return guy1
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
    # pie=initialize(x)
    pie=rz(x,y)
    ps=10
    iter=100
    pls=1
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
    for j in range(iter):
        print(j)
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
                        
        #print(pib)            
        hii[0,j]=j
        hi3[0,j]=setuptime(pib,x,y)
    q=q+1
    plt.plot(hii[0,:],hi3[0,:])       
