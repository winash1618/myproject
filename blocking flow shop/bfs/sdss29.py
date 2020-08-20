
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
    
def setuptime(r,x,y):
    ss=np.zeros(x, dtype=int)
    d=np.zeros((x,y), dtype=int)
    for i in range(x): 
        pt=pp[r[i],:]   
        if i==0:
            ss[i]=kk[0,0,r[i]]  
        else:
            ss[i]=d[i-1,0]+kk[0,r[i-1],r[i]]  
        for j in range(y):
            if i==0:
                if j==0:
                    if (ss[i]+pt[j])>kk[j+1,0,r[i]]:
                        d[i,j]=ss[i]+pt[j]
                    else:
                        d[i,j]=kk[j+1,0,r[i]]
                elif j < y-1:
                    if d[i,j-1]+pt[j]>kk[j+1,0,r[i]]:
                        d[i,j]=d[i,j-1]+pt[j]
                    else:
                        d[i,j]=kk[j+1,0,r[i]]
                else:
                    d[i,j]=d[i,j-1]+pt[j]
            else:
                if j==0:
                    if (ss[i]+pt[j])>(d[i-1,j+1]+kk[j+1,r[i-1],r[i]]):
                        d[i,j]=ss[i]+pt[j]
                    else:
                        d[i,j]=d[i-1,j+1]+kk[j+1,r[i-1],r[i]]
                elif j < y-1:
                    if d[i,j-1]+pt[j]>d[i-1,j+1]+kk[j+1,r[i-1],r[i]]:
                        d[i,j]=d[i,j-1]+pt[j]
                    else:
                        d[i,j]=d[i-1,j+1]+kk[j+1,r[i-1],r[i]]
                else:
                    d[i,j]=d[i,j-1]+pt[j]
   # print(d,ss)
    return d              
    # return d
def tailtime(r,x,y):
    sf=np.zeros(x, dtype=int)  
    f=np.zeros((x,y), dtype=int)
    for i in range(x-1,0-1,-1):
        pt=pp[r[i],:]
    
        if i==x-1:
            sf[i]=0
        elif i>0:
            sf[i]=f[i+1,y-1]+kk[y-1,r[i],r[i+1]]
        else:
            sf[i]=f[i+1,y-1]+kk[y-1,r[i],r[i+1]]
        for j in range(y-1,0-1,-1):
            if i==x-1:
                if j==y-1:
                    f[i,j]=sf[i]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            elif i>0:
                if j==y-1:
                    if sf[i]+pt[j]>f[i+1,j-1]+kk[j-1,r[i],r[i+1]]:
                        
                        f[i,j]=sf[i]+pt[j]
                    else:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                elif j>0:
                    if f[i+1,j-1]+kk[j-1,r[i],r[i+1]]>f[i,j+1]+pt[j]:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                    else:
                        f[i,j]=f[i,j+1]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            else:
                if j==y-1:
                    if sf[i]+pt[j]>f[i+1,j-1]+kk[j-1,r[i],r[i+1]]:
                        f[i,j]=sf[i]+pt[j]
                    else:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                elif j>0:
                    if f[i+1,j-1]+kk[j-1,r[i],r[i+1]]>f[i,j+1]+pt[j]:
                        f[i,j]=f[i+1,j-1]+kk[j-1,r[i],r[i+1]]
                    else:
                        f[i,j]=f[i,j+1]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j] 
    return f
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
def LocalSearch(pi4,x,y):
    num=random.choice(pi4)
    pj=pp[num,:]
    here=np.where(pi4==num)
    pi5=np.delete(pi4,here)
    ss2=np.zeros(x-1, dtype=int)
    d2=np.zeros((x-1,y), dtype=int)
    f2=np.zeros((x-1,y), dtype=int)
    d2=setuptime(pi4,x-1,y)
    f2=tailtime(pi4,x-1,y)
    r=pi5.copy()
    minor=100000
    for hero in range(x):
        cmax=np.zeros((y), dtype=int)
        d3=np.zeros(y, dtype=int)
        for j in range(y):
            if hero==0:
                ss2=0
            else:
                ss2=d2[hero-1,0]+kk[0,r[hero-1],num] 
            if hero==0:
                if j==0:
                    if (ss2+pj[j])>kk[j+1,0,num]:
                        d3[j]=ss2+pj[j]
                    else:
                        d3[j]=kk[j+1,0,r[hero]]
                elif j < y-1:
                    if d3[j-1]+pj[j]>kk[j+1,0,num]:
                        d3[j]=d3[j-1]+pj[j]
                    else:
                        d3[j]=kk[j+1,0,num]
                else:
                    d3[j]=d3[j-1]+pj[j]
            elif hero<x-1:
                if j==0:
                    if (ss2+pj[j])>(d2[hero-1,j+1]+kk[j+1,r[hero-1],num]):
                        d3[j]=ss2+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],num]
                elif j < y-1:
                    if d3[j-1]+pj[j]>d2[hero-1,j+1]+kk[j+1,r[hero-1],num]:
                        d3[j]=d3[j-1]+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],num]
                else:
                    d3[j]=d3[j-1]+pj[j]
            else:
                 
                if j==0:
                    if (ss2+pj[j])>(d2[hero-1,j+1]+kk[j+1,r[hero-1],num]):
                        d3[j]=ss2+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],num]
                elif j < y-1:
                    if d3[j-1]+pj[j]>d2[hero-1,j+1]+kk[j+1,r[hero-1],num]:
                        d3[j]=d3[j-1]+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]+kk[j+1,r[hero-1],num]
                else:
                    d3[j]=d3[j-1]+pj[j]
            if hero<x-1:
                cmax[j]=d3[j]+f2[hero,j]+kk[j,num,pi5[hero]]
            else:
                cmax[j]=d3[j]
        if max(cmax)<minor:
            great=hero
            minor= max(cmax)
    pi5=np.insert(pi5,great,num)
    return pi5
def mm(x,y):
    foo1=[*range(1,x+1)]
    foo2=np.zeros(s[q,1],dtype=int)
    miny=10000
    # print(foo1)
    for i in range(x):
        if pp[foo1[i],0]<miny:
            miny=pp[foo1[i],0]
            foo2[0]=foo1[i]
            ter=i
    foo1.pop(ter)
    # print(foo2,foo1)
    miny=10000
    for i in range(x-1):
        if pp[foo1[i],y-1]<miny:
            miny=pp[foo1[i],y-1]
            foo2[x-1]=foo1[i]
            ter=i
    foo1.pop(ter)
    miny=10000
    phi=0.75
    for k in range(1,x-1):
        ter=0
        miny=10000
        for i in range(len(foo1)):
            pip=0
            for j in range(y-1):
                pip=pip+phi*abs(pp[foo1[i],j]-pp[foo1[i],j+1])+(1-phi)*pp[foo1[i],j]
            pip=pip+(1-phi)*pp[foo1[i],y-1]
            if pip<miny:
                miny=pip
                best=foo1[i]
                ter=i
        foo2[k]=best
        foo1.pop(ter)
    # print(foo2)
    return foo2
def neh(x,y):
    foo3=mm(x,y)
    foo4=np.zeros(1,dtype=int)
    foo4[0]=foo3[0]
    foo5=foo4.copy()
    mano=10000
    for k in range(1,x):
        mano=10000
        for i in range(k+1):
            foo4=np.insert(foo4,i,foo3[k])
            man=setuptime(foo4, k+1, y)
            if man[i-1,y-1]<mano:
                foo5=foo4.copy()
                mano=man[i-1,y-1]
            foo4=np.delete(foo4,i)
        foo4=foo5.copy()
    return foo5
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
    kk=np.zeros((s[q,2],s[q,1]+1,s[q,1]+1), dtype='int64')
    ggo=s[q,0]
    gge=s[q,0]
    generate_flow_shop(q)
    generate_ssd(q)
    # kk=np.zeros((s[q,1]+1,s[q,1]+1,s[q,2]), dtype='int64')
    #print(ssd)
    #print(pp)
    x=s[q,1]
    y=s[q,2]       
    # pie=initialize(x)
    pie=neh(x,y)
    print(setuptime(pie, x, y))
    ps=100
    iter=10000
    pls=0.6
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
        if j!=0:
            print(j, hi3[0,j-1])
        hi4=np.zeros((ps),dtype=int)
        for i in range(ps):
            pi2=nss(a[i,:][:],x)
           # print(pi2)
            #print(a[i,:])
            hip=random.random()
            tom=setuptime(a[i,:],x,y)
            bom=setuptime(pib,x,y)
            hi4[i]=tom[x-1,y-1]
            if hip<pls:
                pi3=LocalSearch(pi2,x,y)
                #print(hip)
                tim=setuptime(pi3,x,y)
                if tim[x-1,y-1]<tom[x-1,y-1]:
                    #print(hip)
                    #print(pi2)
                    a[i,:]=pi3
                    hi4[i]=tim[x-1,y-1]
                    if tim[x-1,y-1]<bom[x-1,y-1]:
                        pib=pi3
            else:
                tim=setuptime(pi2,x,y)
                if tim[x-1,y-1]<tom[x-1,y-1]:
                    #print(hip)
                    #print(pi2)
                    a[i,:]=pi2
                    hi4[i]=tim[x-1,y-1]
                    if tim[x-1,y-1]<bom[x-1,y-1]:
                        pib=pi2
        
        #print(pib)            
        hii[0,j]=j
        hy=setuptime(pib,x,y)
        hi3[0,j]=hy[x-1,y-1]
# =============================================================================
#         vv=np.where(hi4==np.amax(hi4))
#         a[vv,:]=pib
#         hi4[vv]=hi3[0,j]
# =============================================================================
    q=q+1
    plt.plot(hii[0,:],hi3[0,:])   
    
