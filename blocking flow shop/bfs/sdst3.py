
import os
import matplotlib.pyplot as plt
from scipy.io import loadmat
import numpy as np
import random
os.chdir('F:\scilab\manyu')
annots = loadmat('sdst1.mat')
k=np.array(annots['ST'])
annot = loadmat('p1.mat')
p=np.array(annot['p'])


def setuptime(r,x,y):
    s=np.zeros(x, dtype=int)
    d=np.zeros((x,y), dtype=int)
    for i in range(x):
        pt=p[:,r[i]] 
        fu=sum(pt)
        if i==0:
             s[i]=0        
        else:
             s[i]=d[i-1,0]
        for j in range(y):
            if i==0:
                 if j==0:
                    d[i,j]=s[i]+pt[j]+k[0,r[i],j]*0.01*fu*0
                 else:
                    d[i,j]=d[i,j-1]+pt[j]+k[0,r[i],j]*0
            else:
                if j==0:
                    if (s[i]+pt[j]+k[r[i-1],r[i],j]*0)>(d[i-1,j+1]):
                        d[i,j]=s[i]+pt[j]+k[r[i-1],r[i],j]*0.01*fu*0
                    else:
                        d[i,j]=d[i-1,j+1]
                elif j < y-1:
                    if d[i,j-1]+pt[j]+k[r[i-1],r[i],j]*0>d[i-1,j+1]:
                        d[i,j]=d[i,j-1]+pt[j]+k[r[i-1],r[i],j]*0.01*fu*0
                    else:
                        d[i,j]=d[i-1,j+1]
                else:
                    d[i,j]=d[i,j-1]+pt[j]+k[r[i-1],r[i],j]*0.01*fu*0
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

pie=np.array([2,5,4,3,1,10,11,12,15,14,13,9,8,6,7,20,16,17,18,19])
ps=10
iter=10000
pls=1
x=20
y=5
a=np.zeros((ps,x),dtype=int)
a[0,:]=pie
print(a)
for i in range(ps):
    z=random.randrange(0,x-1,1)
    yy=random.randrange(0,x-1,1)
    if z!=yy:
        c=pie[z]
        v=pie[yy]
        dd=pie[c-1]
        gg=pie[v-1]
        pie[c-1]=gg
        pie[v-1]=dd
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
                setuptime(pi2,x,y)
                #print(pi2)
                a[i,:]=pi2
                if setuptime(pi2,x,y)<setuptime(pib,x,y):
                    setuptime(pi2,x,y)
                    pib=pi2
    #print(pib)            
    hii[0,j]=j
    hi3[0,j]=setuptime(pib,x,y)
plt.plot(hii[0,:],hi3[0,:])       
  















