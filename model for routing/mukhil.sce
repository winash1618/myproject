clc
clear
kk=25
pop=10
iter=100
st=1+round(2*rand(1,kk))
pet=[15  13  15 10 14 14 19 13 15 14 12 19 15 14 19 15 15 12 17 19 15 17 15 17 16]
for i=1:kk
    plt(1,i)=pet(1,i)+1+round(2*rand(1,1))
    eet(1,i)=pet(1,i)-1-round(2*rand(1,1))
    elt(1,i)=plt(1,i)+1+round(2*rand(1,1))
end
xx=[11 1.5 5.5 2 8 6.5 38 14 7 37 37 4 24 28 32 32 15 32 23 33 11 13 34 15 31 34 ]
yy=[8.5 23 2 1.5 7 18 14 6 7.5 19 2 2.5 1.5 14 8.5 9 11 4 15 13 2.5 4.5 7.5 5 2 8]
tim=zeros(kk,kk)
for i=1:kk+1
    for j=1:kk+1
        tim(i,j)=sqrt((xx(1,i)-xx(1,j))^2+(yy(1,i)-yy(1,j))^2)
    end
end
tim=tim
phi1=30+round(20*rand(kk+1,kk+1))
gama1=rand(kk+1,kk+1)
delta1=zeros(kk+1,kk+1)
for i=1:kk+1
    for j=1:kk+1
        if i==j
            gama1(i,j)=0
            phi1(i,j)=0
        else
            delta1(i,j)=phi1(i,j)+round((70-phi1(i,j))*rand(1,1))
        end
    end
end
v=5
z=kk+v+1
cad=rand(pop,z)
cap=st*8
maxcap=100
a=zeros(pop,z)
function aa=correcter(aa)
    for j=1:z
        if j==1 | j==z
            if aa(1,j)<=z-v-1 & aa(1,j)~=0
                for i=2:z-1
                    if aa(1,i)>z-v-1 | aa(1,i)==0
                        aa(1,i)=aa(1,j)
                        aa(1,j)=0
                        break
                    end
                end
            else
                aa(1,j)=0
            end
        elseif aa(1,j)>z-v-1
            aa(1,j)=0
        end
    end
    for i=1:z-1
        if aa(1,i)==0 & aa(1,i+1)==0
            if i==1
                k=1
                while k==1
                    rondo=1+round((z-2)*rand(1,1))        
                    if aa(1,rondo+1)~=0 & aa(1,rondo-1)~=0 & aa(1,rondo)~=0
                        temp=aa(1,rondo)
                        aa(1,rondo)=0
                        aa(1,i+1)=temp
                        k=0
                    end
                end
            else
                k=1
                while k==1
                    rondo=2+round((z-3)*rand(1,1))
                    if aa(1,rondo+1)~=0 & aa(1,rondo-1)~=0 & aa(1,rondo)~=0
                        temp=aa(1,rondo)
                        aa(1,rondo)=0
                        aa(1,i)=temp
                        k=0
                    end
                end
            end
        end
    end
endfunction
function aa=capmeet(aa)
    cc=zeros(1,v)
    cb=zeros(v,z)
    cf=zeros(1,v)
    i=1
    k=1
    for j=2:z
        if aa(1,j)==0
            i=i+1
            k=1
        else
            cb(i,k)=aa(1,j)
            cc(1,i)=cc(1,i)+cap(1,aa(1,j))
            cf(1,i)=cf(1,i)+1
            k=k+1
        end
    end
    while max(cc)>=maxcap
        for i=1:v
            if cc(1,i)==max(cc)
                if cf(1,i)>1
                    ro=1+round((cf(1,i)-1)*rand(1,1))
                    temp=cb(i,ro)
                    for j=1:v 
                        if cc(1,j)==min(cc)
                            cb(j,cf(1,j)+1)=temp
                            cc(1,j)=cc(1,j)+cap(1,temp)
                            cf(1,j)=cf(1,j)+1
                            break
                        end
                    end
                    cc(1,i)=cc(1,i)-cap(1,temp)
                    cf(1,i)=cf(1,i)-1
                    j=ro
                    while cb(i,j)~=0
                        cb(i,j)=cb(i,j+1)
                        j=j+1
                    end
                end
                break
            end
        end
    end
    i=1
    k=1
    for j=2:z
        if cb(i,k)==0
            aa(1,j)=0
            k=1
            i=i+1
        else
            aa(1,j)=cb(i,k)
            k=k+1
        end
    end
    i=1
    cc=zeros(1,v)
    cb=zeros(v,z)
    cf=zeros(1,v)
    k=1
    for j=2:z
        if aa(1,j)==0
            i=i+1
            k=1
        else
            cb(i,k)=aa(1,j)
            cc(1,i)=cc(1,i)+cap(1,aa(1,j))
            cf(1,i)=cf(1,i)+1
            k=k+1
        end
    end
endfunction
for i=1:pop
    for j=1:z
        for k=1:z
            if cad(i,k)==min(cad(i,:))
                a(i,j)=k
                cad(i,k)=10000
                break
            end
        end
    end
end
for k=1:pop
    aa=a(k,:)
    aa=correcter(aa)
    aa=capmeet(aa)
    a(k,:)=aa
end
disp(a)
function c=z1(x)
    alpha=30
    betaa=100
    theta=1
    omega=-5
    p=1
    c=(alpha+(betaa/(((phi*sin(gama*x)+delta)^theta)+omega)))*(alpha*sin(gama*x)+delta)*(1+p*(w))
endfunction
function f=dij()
    low=star
    high=fini
    f1=(phi/gama)*(cos(gama*star)-cos(gama*fini))+delta*(fini-star)-d
    while f1<0
        high=high+1
        fini=high
        f1=(phi/gama)*(cos(gama*star)-cos(gama*fini))+delta*(fini-star)-d
    end
    epsilon=abs(d)
    fini=(high-low)/2
    f3=(phi/gama)*(cos(gama*star)-cos(gama*fini))+delta*(fini-star)-d
    while epsilon>0.0001
        if f3<0
            low=fini
            fini=low+(high-low)/2
            f3=(phi/gama)*(cos(gama*star)-cos(gama*fini))+delta*(fini-star)-d
            
        else
            high=fini
            fini=low+(high-low)/2
            f3=(phi/gama)*(cos(gama*star)-cos(gama*fini))+delta*(fini-star)-d
        end
        epsilon=abs(f3)
    end
    f=fini
endfunction
function f=difj(x)
    f=phi*sin(gama*x)+delta
endfunction
function aa=genop1(aa)
    sec1=1+round((z-z/2)*rand(1,1))
    sec2=sec1+1+round((z-sec1-1)*rand(1,1))
    wid1=round((sec1-1)*rand(1,1))
    wid2=round((z-sec2)*rand(1,1))
    if sec1<sec2 then
        if wid1<=wid2
            j=sec2
            for i=sec1-wid1:sec1
                temp=aa(1,i)
                aa(1,i)=aa(1,j)
                aa(1,j)=temp
                j=j+1
            end
        else
            j=sec1-wid1
            for i=sec2:sec2+wid2
                temp=aa(1,i)
                aa(1,i)=aa(1,j)
                aa(1,j)=temp
                j=j+1
            end
        end
    end
endfunction
function b=greedy(b,veh)
    greeder=modulo(1+round((2)*rand(1,1)),3)
    if greeder==0 then
        for i=2:veh
            if tim(kk+1,b(1,2))>tim(kk+1,b(1,i))
                temp=b(1,2)
                b(1,2)=b(1,i)
                b(1,i)=temp
            end
        end
    elseif greeder==1 
        for i=2:veh
            if cap(b(1,2))>cap(b(1,i))
                temp=b(1,2)
                b(1,2)=b(1,i)
                b(1,i)=temp
            end
        end
    else
        for i=2:veh
            if eet(b(1,2))>eet(b(1,i))
                temp=b(1,2)
                b(1,2)=b(1,i)
                b(1,i)=temp
            end
        end
    end
endfunction
function aa=genop2(aa)
    ca=1
    while ca==1
        start=1+round((z-2)*rand(1,1))
        if aa(1,start)==0.0
            ca=0
        end
    end
    j=start
    while aa(1,j+1)~=0
        j=j+1
    end
    ended=j+1
    if (ended-start)>1 then
        u=((iter-y+1)/iter)*(ended-start)
        if u>1 then
            ended=start+round(u)
        else
            ended=1
        end
        veh=ended-start
        bb=zeros(1,veh)
        k=start
        for j=1:veh
            bb(1,j)=aa(1,k)
            k=k+1
        end
        bb=greedy(bb)
        k=start
        for j=1:veh
            aa(1,k)=bb(1,j)
            k=k+1
        end
    end

endfunction
function cs=getobj2()
    cs=0
    if fi<eet1 | fi>elt1 then
        cs=0
    elseif eet1<fi & fi<pet1
        cs=(fi-eet1)/(pet1-eet1)
    elseif pet1<fi & fi<plt1
        cs=1
    elseif plt1<fi & fi<elt1
        cs=(elt1-fi)/(plt1-elt1)
    end
    //disp(fi,cs)
endfunction
//function ranker=NonDominatedSorting(ranker)
//    ranker=ones(1,pop)
//    for i=1:pop
//        for j=1:pop
//            disp(i,ranker)
//            if obj1(1,i)>obj1(1,j) & obj2(1,i)>obj2(1,j) 
//                ranker(1,i)=ranker(1,i)+3
//            elseif obj1(1,i)>obj1(1,j) & obj2(1,i)<obj2(1,j)
//                ranker(1,i)=ranker(1,i)+1
//            elseif obj1(1,i)<obj1(1,j) & obj2(1,i)>obj2(1,j)
//                ranker(1,i)=ranker(1,i)+1
//            end
//        end
//    end
//endfunction
function ranker=NonDominatedSorting(ranker)
    ranker=ones(1,pop)
    for i=1:pop
        for j=1:pop
            if obj1(1,i)>obj1(1,j) 
                ranker(1,i)=ranker(1,i)+3
            elseif obj1(1,i)<obj1(1,j) 
                ranker(1,i)=ranker(1,i)
            else
                ranker(1,i)=ranker(1,i)+1
            end
        end
    end
endfunction
best=zeros(2,iter)
myu=2
cdd=3
cff=42
cee=3
cpm=22
psi=3
cuu=5
diversify=zeros(3,iter)
for y=1:iter
    lt=zeros(1,z)
    at=zeros(1,z)
    obj1=zeros(1,pop)
    obj2=zeros(1,pop)
    obj3=zeros(1,pop)
    tti=zeros(1,pop)
    
    w=0
    for k=1:pop
        wv=0
        for i=1:z-1
            if a(k,i)==0
                d=tim(kk+1,a(k,i+1))   
                phi=phi1(kk+1,a(k,i+1)) 
                gama=gama1(kk+1,a(k,i+1)) 
                delta=delta1(kk+1,a(k,i+1)) 
                eet1=eet(1,a(k,i+1))
                pet1=pet(1,a(k,i+1))
                elt1=elt(1,a(k,i+1))
                plt1=plt(1,a(k,i+1))
                star=0
                fini=0
                at(1,i+1)=lt(1,i)+dij()
                tti(1,k)=tti(1,k)+dij()
                lt(1,i+1)=at(1,i+1)+st(a(k,i+1))
                wv=wv+w
                w=0
                fi=at(1,i+1)-lt(1,i)
                fo=0
                obj1(1,k)=obj1(1,k)+intg(fo,fi,z1)
                obj2(1,k)=obj2(1,k)+getobj2()
                obj3(1,k)=obj3(1,k)+cdd*fi
            elseif a(k,i+1)==0
                d=tim(a(k,i),kk+1)   
                phi=phi1(a(k,i),kk+1)
                gama=gama1(a(k,i),kk+1)
                delta=delta1(a(k,i),kk+1)
                star=0
                fini=0
                at(1,i+1)=lt(1,i)+dij()
                tti(1,k)=tti(1,k)+dij()
                lt(1,i+1)=0
                w=w+cap(1,a(k,i))
                fi=at(1,i+1)-lt(1,i)
                fo=0
                obj1(1,k)=obj1(1,k)+intg(fo,fi,z1)
                obj2(1,k)=obj2(1,k)
                obj3(1,k)=obj3(1,k)+cdd*fi
            else
                d=tim(a(k,i),a(k,i+1))      
                phi=phi1(a(k,i),a(k,i+1))
                gama=gama1(a(k,i),a(k,i+1))
                delta=delta1(a(k,i),a(k,i+1))
                eet1=eet(1,a(k,i+1))
                pet1=pet(1,a(k,i+1))
                elt1=elt(1,a(k,i+1))
                plt1=plt(1,a(k,i+1))
                star=0
                fini=0
                at(1,i+1)=lt(1,i)+dij()
                tti(1,k)=tti(1,k)+dij()
                lt(1,i+1)=at(1,i+1)+st(1,a(k,i+1))
                w=w+cap(1,a(k,i))
                fi=at(1,i+1)-lt(1,i)
                fo=0
                obj1(1,k)=obj1(1,k)+intg(fo,fi,z1)
                obj2(1,k)=obj2(1,k)+getobj2()
                obj3(1,k)=obj3(1,k)+cdd*fi
            end
        end
        obj2(1,k)=kk+1-obj2(1,k)
        obj3(1,k)=obj3(1,k)+exp(tti(1,k))*10000+obj1(1,k)*(cff+cee*myu)+cpm*(1+psi)//+(maxcap*v-wv)*cuu
    end
    ranker=ones(1,pop)
    ranker=NonDominatedSorting()
    //disp(ranker)
    for h=1:pop
        if ranker(1,h)==min(ranker)
            diversify(1,y)=obj1(1,h)
            diversify(2,y)=tti(1,h)
            diversify(3,y)=obj3(1,h)
        end
    end
    pc=0.8
    pi=zeros(1,pop)
    for i=1:pop
        pi(i)=pc*(max(ranker)-ranker(i)+1)/max(ranker)
    end
    for i=1:pop
        prob=rand(1,1)
        if prob<pi(i)
            aa=a(i,:)
            aa=genop1(aa)
            aa=correcter(aa)
            aa=capmeet(aa)
            a(i,:)=aa
        else
            aa=a(i,:)
            aa=genop2(aa)
            a(i,:)=aa
        end 
    end
    best(1,y)=min(obj1)
    best(2,y)=min(obj2)
end
diverse=sqrt((max(diversify(1,:))-min(diversify(1,:)))^2+(max(diversify(2,:))-min(diversify(2,:)))^2+(max(diversify(3,:))-min(diversify(3,:)))^2)
for i=1:iter
    generation(1,i)=i
end
plot(generation,diversify(1,:))
plot(generation,diversify(2,:))
//plot(generation,diversify(3,:)/100)














