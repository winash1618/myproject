//here we also made a function of c
clc
clear
rokl=1
x=3
z=10
pop=10
iter=100
mest=1000*ones(1,pop)
a=zeros(pop,z)
rag=zeros(iter)
ryg=zeros(iter)
cap=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	8	20
]
tim=[0	40	1.5	39	6.8	11	16	12	4.5	17;
40	0	42	9.1	43	38	33	39	34	33;
1.5	42	0	40	8.3	12	17	13	5.4	18;
39	9.1	40	0	41	36	32	38	32	32;
6.8	43	8.3	41	0	4.6	17	12	11	19;
11	38	12	36	4.6	0	13	7.8	11	15;
16	33	17	32	17	13	0	4.8	13	5;
12	39	13	38	12	7.8	4.8	0	12	9.8;
4.5	34	5.4	32	11	11	13	12	0	11;
17	33	18	32	19	15	5	9.8	11	0;

]
dib=[6.8	33	8.3	32	9.2	4.6	9.2	5.8	6.6	9.9;
8.9	36	10	34	9.2	4.6	8	3.2	9.2	13;
15	42	16	41	15	11	10	5.6	15	15;
]
cad=rand(pop,z)
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
best=a
c=a
temp=zeros(pop,x)
tempo=zeros(pop,x)
temo=zeros(pop,x)
function [kom,kiq,temo] =findmut(z1,zkom)
    temo=zeros(pop,x)
    rep=zeros(pop,z)
    kiq=zeros(pop,z)
    for ka=1:pop
        po=zeros(x,z)
        ckom=zkom(ka,:)
        i=1
        for k=1:x
            r=1
            while i<min(ckom) & i<=z
                po(k,r)=z1(ka,i)
                r=r+1
                if i<=z
                    i=i+1
                end
            end
            for g=1:x-1
                if ckom(g)==min(ckom)
                    ckom(g)=100
                break
                end
            end
        end
        mik=1
        bii=7+(15)*(1-(y/iter))
        bi=(1.05-(y/iter))
        for k=1:x
            for i=1:z
                bi1=rand(1,1)
                if po(k,i+1)~=0 
                    if tim(po(k,i),po(k,i+1))>bii & bi1<bi
                        rep(ka,mik)=po(k,i+1)
                    end
                    if dib(k,po(k,1))>bii & i==1 & bi1<bi
                            rep(ka,mik)=po(k,1)
                        end
                    mik=mik+1
                else
                    if  po(k,i)~=0
                        if po(k,i+1)==0 & dib(k,po(k,i))>bii & bi1<bi
                            rep(ka,mik)=po(k,i)  
                        end
                        temo(ka,k)=i
                    end
                    break
                end
            end
        end
    end
    kom=zkom
    kiq=rep
endfunction
function [dis2] =finddis(z1,zkom)
    tempi=zeros(pop,x)
    dis2=zeros(pop,x)
    for ka=1:pop
        po=zeros(x,z)
        i=1
        ckom=zkom(ka,:)
        for k=1:x
            r=1
            while i<min(ckom) & i<=z
                po(k,r)=z1(ka,i)
                r=r+1
                if i<=z
                    i=i+1
                end
            end
            for g=1:x-1
                if ckom(g)==min(ckom)
                    ckom(g)=100
                break
                end
            end
        end
        for k=1:x
            for i=1:z
                if po(k,i+1)~=0 
                    dis2(ka,k)=dis2(ka,k)+tim(po(k,i),po(k,i+1))
                else
                    break
                end
            end
        end
        for k=1:x
            for i=1:z
                if(po(k,i)~=0)
                    tempi(ka,k)=tempi(ka,k)+1
                end
            end
            if tempi(ka,k)>0              
                dis2(ka,k)=dis2(ka,k)+dib(k,po(k,1))+dib(k,po(k,tempi(ka,k)))
            end
        end
    end
endfunction
function [n] = mutate(b,kiu,temi)
    gnd=ones(pop,x)
    for k=1:pop
    for i=1:x
        if i==1
            gnd(k,i)=0
        else
            gnd(k,i)=gnd(k,i-1)+temi(k,i-1)
        end
    end
    oll=rand(1,1)
    if oll<0.3 then
        xio=rand(1,1)
        if xio<(y/iter)
        r=1
        for i=1:x
            poll=rand(1,1)
            if i==1
                mut1=1+round((temi(k,i)-1)*rand(1,1))
                mut2=1+round((temi(k,i)-1)*rand(1,1))
                if poll<0.2 & mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    r=r+1
                end
            else
                mut1=gnd(k,i)+round((temi(k,i)-1)*rand(1,1))
                mut2=gnd(k,i)+round((temi(k,i)-1)*rand(1,1))
                if poll<0.2 & mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    r=r+1
                end   
            end
            if r~=1
                break;
            end
        end
    else
        mut1=1+round((z-1)*rand(1,1))
                mut2=1+round((z-1)*rand(1,1))
                temper=b(k,mut2)
                b(k,mut2)=b(k,mut1)
                b(k,mut1)=temper
    end 
    else
        for mi=1:x
            if kip(k,mi)~=0
                mut1=1+round((z-1)*rand(1,1))
                temper=b(k,mut1)
                b(k,mut1)=b(k,mi)
                b(k,mi)=temper
            end
        end 
    end        
    end
    n=b
endfunction
function [n] = mutate1(b,kiu,temi)
    gnd=ones(pop,x)
    for k=1:pop
    for i=1:x
        if i==1
            gnd(k,i)=0
        else
            gnd(k,i)=gnd(k,i-1)+temi(k,i-1)
        end
    end
    oll=rand(1,1)
    if oll<0.7 then
        xio=rand(1,1)
        if xio<(y/iter)
        r=1
        for i=1:x
            poll=rand(1,1)
            if i==1
                mut1=1+round((temi(k,i)-1)*rand(1,1))
                mut2=1+round((temi(k,i)-1)*rand(1,1))
                if poll<0.2 & mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    r=r+1
                end
            else
                mut1=gnd(k,i)+round((temi(k,i)-1)*rand(1,1))
                mut2=gnd(k,i)+round((temi(k,i)-1)*rand(1,1))
                if poll<0.2 & mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    r=r+1
                end   
            end
            if r~=1
                break;
            end
        end
    else
        mut1=1+round((z-1)*rand(1,1))
                mut2=1+round((z-1)*rand(1,1))
                temper=b(k,mut2)
                b(k,mut2)=b(k,mut1)
                b(k,mut1)=temper
    end 
    else
        for mi=1:x
            if kip(k,mi)~=0
                mut1=1+round((z-1)*rand(1,1))
                temper=b(k,mut1)
                b(k,mut1)=b(k,mi)
                b(k,mi)=temper
            end
        end 
    end        
    end
    n=b
endfunction
function [z1] =roulewheel(dis2,z1,zkom)
    tdis=zeros(1,pop)
    pdis=zeros(1,pop)
    cdis=zeros(1,pop)
    calm=z1
    for i=1:pop
        tdis(i)=sum(dis2(i,:))
        tdis(i)=1/(1+tdis(i))
    end
    for i=1:pop
        pdis(i)=tdis(i)/(sum(tdis))
    end
    for i=1:pop
        if i==1
            cdis(i)=cdis(i)+pdis(i)
        else
            cdis(i)=cdis(i-1)+pdis(i)
        end
    end
    for i=1:pop
        jin=rand(1,1)
        for j=1:pop
            if j==1 
                if jin<cdis(j)
                    calm(i,:)=z1(j,:)
                    break
                end
            else
                if cdis(j-1)<jin & jin<=cdis(j)
                    calm(i,:)=z1(j,:)
                    break
                end
            end
        end
    end
    z1=calm
endfunction
function [a,dis1,temp]=aisrule(a,kop)
    pest=1000*ones(1,pop)
    aa=a
    iter1=30
    rag1=zeros(iter1)
    ryg1=zeros(iter1)
    for io=1:iter1
        dix=zeros(pop,x)
        myg=zeros(1,pop)
        temt=zeros(pop,x)
        [kop,kip,temt] =findmut(aa,kop)
        [aa]=mutate1(aa,kip,temt)
        [dix]=finddis(aa,kop)
        for i=1:pop
        myg(i)=sum(dix(i,:))
            if pest(i)>myg(i) then
                a(i,:)=aa(i,:)
                pest(i)=myg(i)
                dis1(i,:)=dix(i,:)
                //kop(i,:)=lkop(i,:)
                temp(i,:)=temt(i,:)
            end
        end
        [aa]=roulewheel(dis1,a,kop)
        rag1(io)=min(pest)
        ryg1(io)=io
    end
    plot(ryg1,rag1)
endfunction
function [c,dis,tempo]=cisrule(c,bkom)
    pest=1000*ones(1,pop)
    cc=c
    iter1=2
    rag1=zeros(iter1)
    ryg1=zeros(iter1)
    for io=1:iter1
        dix=zeros(pop,x)
        myg=zeros(1,pop)
        temt=zeros(pop,x)
        [bkom,kip1,temt] =findmut(cc,bkom)
        [cc]=mutate(cc,kip1,temt)
        [dix]=finddis(cc,bkom)
        for i=1:pop
        myg(i)=sum(dix(i,:))
            if pest(i)>myg(i) then
                c(i,:)=cc(i,:)
                pest(i)=myg(i)
                dis(i,:)=dix(i,:)
                //kop(i,:)=lkop(i,:)
                tempo(i,:)=temt(i,:)
            end
        end
        [cc]=roulewheel(dis,c,bkom)
        rag1(io)=min(pest)
        ryg1(io)=io
    end
    plot(ryg1,rag1)
endfunction
toper=1000
kip=zeros(pop,z)
kip1=kip
kiq=kip
esup=zeros(1,z)
bkom=1+round((z-1)*rand(pop,(x-1)))
kop=bkom
bbom=zeros(pop,(x-1))
gd=zeros(1,x)
for y=1:iter
    dis=zeros(pop,x)
    dis1=zeros(pop,x)
    kop=1+round((z-3)*rand(pop,(x-1)))
    [a,dis1,temp]=aisrule(a,kop)
    [c,dis,tempo]=cisrule(c,bkom)
    mog=zeros(1,pop)
    mog1=zeros(1,pop)
    for i=1:pop
        mog(i)=sum(dis(i,:))
        mog1(i)=sum(dis1(i,:))
        if mog(i)>mog1(i) then
            c(i,:)=a(i,:)
            mog(i)=mog1(i)
            dis(i,:)=dis1(i,:)
            bkom(i,:)=kop(i,:)
            tempo(i,:)=temp(i,:)
        end
        if toper>mog(i) then
            toper=mog(i)
            esup=c(i,:)
            gd=tempo(i,:)
            rokl=y
        end
        if mest(i)>mog(i)
        best(i,:)=c(i,:)
        mest(i)=mog(i)
        dist(i,:)=dis(i,:)
        bbom(i,:)=bkom(i,:)
        end
    end
    c=best
    bkom=bbom
    dis=dist
    rag(y)=min(mest)
    ryg(y)=y
    a=c
    [a]=roulewheel(dis,a,bkom)
end
plot(ryg,rag)
tomp=zeros(1,x)
sup=esup
for j=1:x
    if(j==1)
        tomp(j)=gd(j)
    else
        tomp(j)=tomp(j-1)+gd(j)
    end
end
fine=zeros(x,z)
for j=1:x
    if j==1 then
        for k=1:tomp(j)
            fine(j,k)=sup(k)
        end
    else
        i=1
        for k=tomp(j-1)+1:tomp(j)
            fine(j,i)=sup(k)
            i=i+1
        end
    end
end
namer=[	"KARTHIKAPURAM" "KARMALAGIRI KSS LTD" "UDAYAGIRI" "SREEPURAM" "VIJAYAGIRI" "OTTATHAI" "THADIKADAVU" "MEEMBATTY"  "NEDUVODE" "VIMALASSERY"
]
bmc=["ARANGAM" "KOTTAYAD" "VELLAD" 
]
yum=0
for i=1:1:x
    for j=1:z
        if fine(i,j)>0
            if j==1 
                disp(bmc(i))
                disp(dib(i,fine(i,j)))
                yum=yum+dib(i,fine(i,j))
            end
            disp(namer(fine(i,j)))
            if j~=gd(i) then
                disp(tim(fine(i,j),fine(i,j+1)))
                yum=yum+tim(fine(i,j),fine(i,j+1))
            end
            if j==gd(i)
                disp(dib(i,fine(i,j)))
                yum=yum+dib(i,fine(i,j))
                disp(bmc(i))
            end
        end
    end
end
disp(yum)








