import os
import matplotlib.pyplot as plt
import numpy as np
import random
import math
os.chdir('F:\scilab\manyu')
s =np.array( [
  [         0,  0, 0],
  [  2013025619,  200, 20],
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
    fir=low+math.floor(ff*(high -low +1))
    return(seed,fir)
def generate_flow_shop(q):
    global gge
    for i in range(s[q,2]):
        for j in range(1,s[q,1]+1):
            gge,pp[j,i]=unif(gge,1,99) 
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
                elif j < y-1:
                    d[i,j]=d[i,j-1]+pt[j]
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
    return d   
def tailtime(r,x,y):
    sf=np.zeros(x, dtype=int)  
    f=np.zeros((x,y), dtype=int)
    for i in range(x-1,0-1,-1):
        pt=pp[r[i],:]
    
        if i==x-1:
            sf[i]=0
        elif i>0:
            sf[i]=f[i+1,y-1]
        else:
            sf[i]=f[i+1,y-1]
        for j in range(y-1,0-1,-1):
            if i==x-1:
                if j==y-1:
                    f[i,j]=sf[i]+pt[j]
                else:
                    f[i,j]=f[i,j+1]+pt[j]
            elif i>0:
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
    return f
def nsso(pi,x):
    d=random.randrange(1,10,1)
    a=d%2
    if a==0:
        d=random.randrange(1,10,1)
        b=d%2
        if b==1:
            pi1=insertf(pi.copy(),x)
        else: 
            pi1=insertb(pi.copy(),x)
    elif a==1:
        pi1=swap(pi.copy(),x)
    return pi1
            
def nss(pi,x):
    d=random.randrange(1,10,1)
    a=d%4
    if a==0:
        d=random.randrange(1,10,1)
        b=d%2
        if b==1:
            pi1=insertf(pi.copy(),x)
        else: 
            pi1=insertb(pi.copy(),x)
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
    elif a==4:
        pi1=swap(pi.copy(),x)
        d=random.randrange(1,10,1)
        b=d%2
        if b==1:
            pi1=insertf(pi1.copy(),x)
        else:   
            pi1=insertb(pi1.copy(),x)
    return pi1
                
def insertf(r,x):
    z=random.randrange(0,x-2,1)
    y=z+random.randrange(0,x-z,1)
    while z>=y:
        z=random.randrange(0,x-2,1)
        y=z+random.randrange(0,x-z,1)
    if z<y:
       for i in range(z,y):
            c=r[i]
            d=r[i+1]
            r[i]=d
            r[i+1]=c
    return r
def insertb(r,x):
    z=random.randrange(0,x-2,1)
    y=z+random.randrange(0,x-z,1)
    while z>=y:
        z=random.randrange(0,x-2,1)
        y=z+random.randrange(0,x-z,1)
    if z<y:
        for i in range(y,z,-1):
            c=r[i]
            d=r[i-1]
            r[i]=d
            r[i-1]=c
    return r
def swap(r,x):
    z=random.randrange(0,x,1)
    y=random.randrange(0,x,1)
    while z==y:
        z=random.randrange(0,x,1)
        y=random.randrange(0,x,1)
    # print(z,y)
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
    minor=100000
    for hero in range(x):
        cmax=np.zeros((y), dtype=int)
        d3=np.zeros(y, dtype=int)
        for j in range(y):
            if hero==0:
                ss2=0
            else:
                ss2=d2[hero-1,0]
            if hero==0:
                if j==0:
                    d3[j]=ss2+pj[j]
                elif j < y-1:
                    d3[j]=d3[j-1]+pj[j]
                else:
                    d3[j]=d3[j-1]+pj[j]
            elif hero<x-1:
                if j==0:
                    if (ss2+pj[j])>(d2[hero-1,j+1]):
                        d3[j]=ss2+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]
                elif j < y-1:
                    if d3[j-1]+pj[j]>d2[hero-1,j+1]:
                        d3[j]=d3[j-1]+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]
                else:
                    d3[j]=d3[j-1]+pj[j]
            else:
                 
                if j==0:
                    if (ss2+pj[j])>(d2[hero-1,j+1]):
                        d3[j]=ss2+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]
                elif j < y-1:
                    if d3[j-1]+pj[j]>d2[hero-1,j+1]:
                        d3[j]=d3[j-1]+pj[j]
                    else:
                        d3[j]=d2[hero-1,j+1]
                else:
                    d3[j]=d3[j-1]+pj[j]
            if hero<x-1:
                cmax[j]=d3[j]+f2[hero,j]
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
    for i in range(x):
        if pp[foo1[i],0]<miny:
            miny=pp[foo1[i],0]
            foo2[0]=foo1[i]
            ter=i
    foo1.pop(ter)
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
    return foo2
def neh(x,y):
    foo3=mm(x,y)
    foo4=np.zeros(1,dtype=int)
    foo4[0]=foo3[0]
    foo5=foo4.copy()
    mano=10000
    for k in range(1,x):
        print(foo4)
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
    i=0
    while len(foo)!=0:
        pie[i]=random.choice(foo)
        foo.remove(pie[i])
        i=i+1
    return pie
gu,gi=s.shape
q=1
d22=np.zeros((2,s[q,1]),dtype=int)
d23=np.zeros((2),dtype=int)
ram=0
while s[q,0]!=0:
    pp=np.zeros((s[q,1]+1,s[q,2]), dtype='int64')
    ggo=s[q,0]
    gge=s[q,0]
    generate_flow_shop(q)
    x=s[q,1]
    y=s[q,2]       
    pie=initialize(x)
    # pie=neh(x,y)
    # pie=np.array([ 4, 10,  7,  8, 18, 17, 14, 13, 15, 12, 16,  2, 20, 11,  1,  6, 19,
    #     3,  9,  5])
    print(setuptime(pie, x, y))
    ps=10
    iter=2000
    a=np.zeros((ps,x),dtype=int)
    pie2=pie.copy()
    a[0,:]=pie
    for i in range(1,ps):
        z=random.randrange(0,x,1)
        yy=random.randrange(0,x,1)
        if z!=yy:
            c=pie[z]
            v=pie[yy]
            dd1=pie[c-1]
            gg=pie[v-1]
            pie[c-1]=gg
            pie[v-1]=dd1
        a[i,:]=pie
        # pie=pie2.copy()
    print(a)
    pib=a[0,:]
    hii=np.zeros((1,iter),dtype=int)
    hi3=np.zeros((1,iter),dtype=int)
    b=a.copy()
    c=a.copy()
    hi4=np.zeros(ps,dtype=int)
    hi5=np.zeros(ps,dtype=int)
    ker=0.05
    for j in range(iter):
        if j!=0:
            print(j, hi3[0,j-1])
        hi6=np.zeros(ps,dtype=int)
        for i in range(ps):
            b[i,:]=LocalSearch(nss(a[i,:][:],x),x,y)
            tim=setuptime(b[i,:],x,y)
            hi5[i]=tim[x-1,y-1]
            tom=setuptime(a[i,:],x,y)
            hi4[i]=tom[x-1,y-1]
        # for i in range(ps):
        #     for jjj in range(ps):
        #         if hi5[i]==hi4[jjj]:
        #             b[i,:]=initialize(x)
        #             hi5[i]=100000
        #             break
        # print(hi5,hi4)
        i=0
        temp=0
        while i<ps:
            kol=0
            while kol==0:
                for k in range(ps):
                    if hi4[k]==np.amin(hi4):
                        if hi4[k]==temp:
                            hi4[k]=100000
                            break
                        if np.mean(hi4)==100000:
                           kol=1
                           break
                        temp=hi4[k]
                        c[i,:][:]=a[k,:][:].copy()
                        hi6[i]=hi4[k]
                        hi4[k]=100000
                        i=i+1
                        if i>=0.9*ps or np.mean(hi4)==100000:
                            kol=1
                            break
            while i<ps:
                for k in range(ps):
                    if hi5[k]==np.amin(hi5):
                        c[i,:][:]=b[k,:][:].copy()
                        hi6[i]=hi5[k]
                        hi5[k]=100000
                        i=i+1
                        if i==ps:
                            break
            # while i<ps:
            #     c[i,:][:]=nss(pib.copy(),x)
            #     kil=setuptime(b[i,:],x,y)
            #     hi6[i]=kil[x-1,y-1]
            #     i=i+1
        a=c.copy()
        hi4=hi6.copy() 
        hii[0,j]=j
        vv=np.where(hi4==np.amin(hi4))
        vv=vv[0]
        pib=a[vv[0],:].copy()
        hy=setuptime(pib,x,y)
        hi3[0,j]=hy[x-1,y-1]
        # pio=pib
        # kin=0
        # if j>ker*iter:
        #     for jj in range(x):
        #         for ko in range(j+1,x):
        #             qq=pib[jj]
        #             ww=pib[ko]
        #             pio[jj]=ww
        #             pio[ko]=qq
        #             bio=setuptime(pio,x,y)
        #             if bio[x-1,y-1]<hy[x-1,y-1]:
        #                 a[vv[0],:]=pio
        #                 kin=1
        #     if kin==0:
        #         a[vv[0],:]=a[1,:]
        #     ker=ker+0.01
    i=0
    print(pib)
    for i in range(ps):
        print(i)
        pio=a[i,:].copy()
        for jj in range(x):
            # print(pib)
            for ko in range(jj+1,x):
                qq=a[i,jj]
                ww=a[i,ko]
                pio[jj]=ww
                pio[ko]=qq
                bio=setuptime(pio,x,y)
                if bio[x-1,y-1]<hi4[i]:
                    c[i,:]=pio.copy()
                    hi6[i]=bio[x-1,y-1]
                if bio[x-1,y-1]==1341:
                    print(pio,bio[x-1,y-1])
                    pib=pio.copy()
                pio=a[i,:].copy()
    q=q+1
    print(pib)
    plt.plot(hii[0,:],hi3[0,:])   
    d22[ram,:]=pib
    d23[ram]=hy[x-1,y-1]
    print(d22,d23)
    ram=ram+1
