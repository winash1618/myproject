clc
clear
kk=24
pop=10
iter=100
st=[28.8	9.5	11.5	13.3	10.7	2.2	3.4	2.8	18.6	19.0	3.3	5.6	10.0	9.0	8.2	1.43	68	16.6	4.4	7.3	7.2	6.0	6.8	8
]

tim=[
0	5.9	6.2	5.6	27	17	20	29	19	18	16	23	24	34	11	9	11	11	13	17	14	30	25	28	27;
5.9	0	3.4	3.9	32	22	26	36	26	23	21	30	29	34	17	17	18	9.9	13	19	16	32	27	31	29;
6.2	3.4	0	5.7	35	25	28	36	23	19	22	30	32	41	18	16	19	11	14	21	18	34	28	32	31;
5.6	3.9	5.7	0	29	19	22	30	21	19	17	26	26	36	13	10	13	5.5	8.8	15	12	28	23	26	25;
27	32	35	29	0	6.5	4.5	7.5	16	15	12	10	9.7	6.8	17	18	18	27	29	22	29	34	31	32	21;
17	22	25	19	6.5	0	2.9	13	9	9.6	3.7	7.6	6.9	12	7	8.3	8.5	17	79	18	19	25	21	23	14;
20	26	28	22	4.5	2.9	0	11	13	13	6.6	6.2	5.5	10	10	11	11	20	21	18	22	23	20	22	12;
29	36	36	30	7.5	13	11	0	23	23	19	16	16	10	21	22	23	31	32	28	33	38	35	36	22;
19	26	23	21	16	9	13	23	0	2	5.9	17	16	23	11	11	12	21	22	22	23	36	30	34	23;
18	23	19	19	15	9.6	13	23	2	0	5.6	17	17	22	9.6	9.5	13	22	23	22	24	40	34	38	23;
16	21	22	17	12	3.7	6.6	19	5.9	5.6	0	11	11	19	5.6	6.8	7	16	17	16	18	34	28	32	18;
23	30	30	26	10	7.6	6.2	16	17	17	11	0	0.7	5.8	15	16	12	23	22	12	15	18	15	16	6.8;
24	29	32	26	9.7	6.9	5.5	16	16	17	11	0.7	0	5.1	14	15	12	23	22	13	15	18	14	16	6.9;
34	34	41	36	6.8	12	10	10	23	22	19	5.8	5.1	0	24	25	17	28	27	18	20	23	21	21	9.8;
11	17	18	13	17	7	10	21	11	9.6	5.6	15	14	24	0	5.2	2.1	11	12	12	13	29	24	27	18;
9	17	16	10	18	8.3	11	22	11	9.5	6.8	16	15	25	5.2	0	5.7	13	14	18	15	31	25	29	21;
11	18	19	13	18	8.5	11	23	12	13	7	12	12	17	2.1	5.7	0	11	13	9.4	11	23	18	21	15;
11	9.9	11	5.5	27	17	20	31	21	22	16	23	23	28	11	13	11	0	7.4	11	8	24	19	22	21;
13	13	14	8.8	29	79	21	32	22	23	17	22	22	27	12	14	13	7.4	0	9.8	6.8	23	18	21	20;
17	19	21	15	22	18	18	28	22	22	16	12	13	18	12	18	9.4	11	9.8	0	3.4	15	9.7	13	11;
14	16	18	12	29	19	22	33	23	24	18	15	15	20	13	15	11	8	6.8	3.4	0	17	11	15	14;
30	32	34	28	34	25	23	38	36	40	34	18	18	23	29	31	23	24	23	15	17	0	8	2.3	14;
25	27	28	23	31	21	20	35	30	34	28	15	14	21	24	25	18	19	18	9.7	11	8	0	6.1	11;
28	31	32	26	32	23	22	36	34	38	32	16	16	21	27	29	21	22	21	13	15	2.3	6.1	0	12;
27	29	31	25	21	14	12	22	23	23	18	6.8	6.9	9.8	18	21	15	21	20	11	14	14	11	12	0;


]
pet=[8.8	9.5	10.2	10.3	10.1	9.2	9.4	8.8	9.6	9.0	9.3	9.9	10.0	9.1	9.2	9.3	9.8	9.6	8.4	9.3	9.2	9.0	9.8	9
]
plt=pet*1.1
eet=pet*0.9
elt=plt*1.1
for i = 1:kk+1
    for j = 1:kk+1
        if i<j
            tim(i,j)=790+round(rand(1,1)*(980-790))
            tim(j,i)=tim(i,j)
        end
    end
end
phi=70
gama=0.5
delta=80
v=4
z=kk+v+1
cad=rand(pop,z)
cap=st*1.2
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
    betaa=10
    theta=1
    omega=-5
    l=250
    p=1
    c=(alpha+(betaa/(((phi*sin(gama*x)+delta)^theta)+omega)))*(phi*sin(gama*x)+delta)//*(1+p*(w/l))//correction phi not alpha
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
    fin=(fi-fo)
    //disp(fin,plt1,pet1,d)
    break
    if fin<eet1 | fin>elt1 then
        cs=0
    elseif eet1<fin & fin<pet1
        cs=(fin-eet1)/(pet1-eet1)
        
    elseif pet1<fin & fin<plt1
        cs=1
    elseif plt1<fin & fin<elt1
        cs=(elt1-fin)/(elt1-plt1)
        //disp(cs,plt1,elt1,fin)
    end
    
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
            if obj1(1,i)>obj1(1,j) & obj2(1,i)>obj2(1,j) & obj3(1,i)>obj3(1,j) 
                ranker(1,i)=ranker(1,i)+3
            elseif obj1(1,i)<obj1(1,j)& obj2(1,i)<obj2(1,j) & obj3(1,i)<obj3(1,j) 
                ranker(1,i)=ranker(1,i)
            else
                ranker(1,i)=ranker(1,i)+1
            end
        end
    end
endfunction
function ranker1=NonDominatedSorting1(ranker1)
    ranker1=ones(1,2*pop)
    for i=1:2*pop
        for j=1:2*pop
            if bob1(1,i)>bob1(1,j) & bob2(1,i)>bob2(1,j) & bob3(1,i)>bob3(1,j) 
                ranker1(1,i)=ranker1(1,i)+3
            elseif bob1(1,i)<bob1(1,j) & bob2(1,i)<bob2(1,j) & bob3(1,i)<bob3(1,j) 
                ranker1(1,i)=ranker1(1,i)
            else
                ranker1(1,i)=ranker1(1,i)+1
            end
        end
    end
endfunction
myu=2
cdd=3
cff=42
cee=3
cpm=22
psi=3
cuu=5
ddd=0
diversify=zeros(3,iter)
for y=1:iter
    lt=zeros(1,z)
    at=zeros(1,z)
    obj1=zeros(1,pop)
    obj2=zeros(1,pop)
    obj3=zeros(1,pop)
    w=0
    for k=1:pop
        wv=0
        ddd=0
        for i=1:z-1
            if a(k,i)==0
                d=tim(kk+1,a(k,i+1))
                eet1=eet(1,a(k,i+1))
                pet1=pet(1,a(k,i+1))
                elt1=elt(1,a(k,i+1))
                plt1=plt(1,a(k,i+1))
                star=0
                fini=0
                at(1,i+1)=lt(1,i)+dij()
                lt(1,i+1)=at(1,i+1)+st(a(k,i+1))
                //disp(delta+phi*sin(gama))
                wv=wv+w
                w=0
                fi=at(1,i+1)
                fo=lt(1,i)
                obj1(1,k)=obj1(1,k)+intg(fo,fi,z1)
                obj2(1,k)=obj2(1,k)+getobj2()
                //obj3(1,k)=obj3(1,k)+cdd*fi
                //break
            elseif a(k,i+1)==0
                d=tim(a(k,i),kk+1)
                star=0
                fini=0
                at(1,i+1)=lt(1,i)+dij()
                lt(1,i+1)=0
                //disp(d,at,lt)
                w=w+cap(1,a(k,i))
                fi=at(1,i+1)
                fo=lt(1,i)
                obj1(1,k)=obj1(1,k)+intg(fo,fi,z1)
                //disp(obj1,fi,fo)
                obj2(1,k)=obj2(1,k)
                //obj3(1,k)=obj3(1,k)+cdd*fi
            else
                d=tim(a(k,i),a(k,i+1))   
                eet1=eet(1,a(k,i+1))
                pet1=pet(1,a(k,i+1))
                elt1=elt(1,a(k,i+1))
                plt1=plt(1,a(k,i+1))
                star=0
                fini=0
                at(1,i+1)=lt(1,i)+dij()
                lt(1,i+1)=at(1,i+1)+st(1,a(k,i+1))
                w=w+cap(1,a(k,i))
                fi=at(1,i+1)
                fo=lt(1,i)
                obj1(1,k)=obj1(1,k)+intg(fo,fi,z1)
                //disp(obj1,fi,fo)
                obj2(1,k)=obj2(1,k)+getobj2()
                //obj3(1,k)=obj3(1,k)+cdd*fi
            end
            //disp(ddd)
            ddd=ddd+d
            //disp(ddd)
            //break
        end
        //disp()
       //break
        
        obj2(1,k)=kk+1-obj2(1,k)
        //disp(kk+1-obj2(1,k))
        //obj3(1,k)=obj3(1,k)+obj1(1,k)*(cff+cee*myu)+cpm*(1+psi)+(maxcap*v-wv)*cuu
        obj3(1,k)=ddd
    end
    ranker=ones(1,pop)
    ranker1=ones(1,2*pop)
    if y==1
        
        best=a
        obj11=obj1
        obj22=obj2
        obj33=obj3
        ranker=NonDominatedSorting()
    else
        bob=zeros(2*pop,z)
        bob1=zeros(1,2*pop)
        bob2=zeros(1,2*pop)
        bob3=zeros(1,2*pop)
        for i=1:2*pop
            if i<=pop
                bob(i,:)=best(i,:)
                bob1(1,i)=obj11(1,i)
                bob2(1,i)=obj22(1,i)
                bob3(1,i)=obj33(1,i)
            else
                bob(i,:)=a(i-pop,:)
                bob1(1,i)=obj1(1,i-pop)
                bob2(1,i)=obj2(1,i-pop)
                bob3(1,i)=obj3(1,i-pop)
            end
         end
         ranker1=NonDominatedSorting1()
         for i=1:pop
             for h=1:2*pop
                 if ranker1(1,h)==min(ranker1)
                    ranker(1,i)=ranker1(1,h)
                    ranker1(1,h)=19999
                    obj1(1,i)=bob1(1,h)
                    obj2(1,i)=bob2(1,h)
                    obj3(1,i)=bob3(1,h)
                    a(i,:)=bob(h,:)
                    break
                 end
             end
         end
         
        best=a
        obj11=obj1
        obj22=obj2
        obj33=obj3
    end
    
   // disp(ranker,obj1,obj2,obj3)
    for h=1:pop
        if ranker(1,h)==min(ranker)
            diversify(1,y)=obj1(1,h)
            diversify(2,y)=obj2(1,h)
            diversify(3,y)=obj3(1,h)
        end
    end
    pc=0.8
    for i=1:pop
        pi(i)=pc*(max(ranker)-ranker(i)+1)/max(ranker)
    end
    for i=1:pop
        prob=rand(1,1)
        if prob>pi(i)
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
end
for i=1:iter
    generation(1,i)=i
end
plot(generation,diversify(1,:)/60000)
plot(generation,diversify(2,:))
plot(generation,diversify(3,:)/1000)















