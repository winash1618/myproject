// this is 8 vehicle 
clc
clear
rokl=1
x=8
d=5
z=25
pop=10
iter=1000
mest=1000*ones(1,pop)
a=zeros(pop,z)
rag=zeros(iter)
ryg=zeros(iter)
cap=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	8	20
]
tim=[0	12	6.2	5.6	27	17	20	29	44	18	16	23	24	34	11	9	11	11	13	17	14	30	25	28	27;
12	0	5.2	9.9	39	29	32	40	52	29	27	34	36	46	23	20	23	15	18	24	21	37	32	36	34;
6.2	5.2	0	5.7	35	25	28	36	48	19	22	30	32	41	18	16	19	11	14	21	18	34	28	32	31;
5.6	9.9	5.7	0	29	19	22	30	42	19	17	26	26	36	13	10	13	5.5	8.8	15	12	28	23	26	25;
27	39	35	29	0	6.5	4.5	7.5	41	15	12	10	9.7	6.8	17	18	18	27	29	22	29	34	31	32	21;
17	29	25	19	6.5	0	2.9	13	35	9.6	3.7	7.6	6.9	12	7	8.3	8.5	17	79	18	19	25	21	23	14;
20	32	28	22	4.5	2.9	0	11	34	13	6.6	6.2	5.5	10	10	11	11	20	21	18	22	23	20	22	12;
29	40	36	30	7.5	13	11	0	44	23	19	16	16	10	21	22	23	31	32	28	33	38	35	36	22;
44	52	48	42	41	35	34	44	0	54	6.6	6.2	5.5	10	10	11	11	20	21	18	21	23	20	22	12;
18	29	19	19	15	9.6	13	23	54	0	5.6	17	17	22	9.6	9.5	13	22	23	22	24	40	34	38	23;
16	27	22	17	12	3.7	6.6	19	6.6	5.6	0	11	11	19	5.6	6.8	7	16	17	16	18	34	28	32	18;
23	34	30	26	10	7.6	6.2	16	6.2	17	11	0	0.7	5.8	15	16	12	23	22	12	15	18	15	16	6.8;
24	36	32	26	9.7	6.9	5.5	16	5.5	17	11	0.7	0	5.1	14	15	12	23	22	13	15	18	14	16	6.9;
34	46	41	36	6.8	12	10	10	10	22	19	5.8	5.1	0	24	25	17	28	27	18	20	23	21	21	9.8;
11	23	18	13	17	7	10	21	10	9.6	5.6	15	14	24	0	5.2	2.1	11	12	12	13	29	24	27	18;
9	20	16	10	18	8.3	11	22	11	9.5	6.8	16	15	25	5.2	0	5.7	13	14	18	15	31	25	29	21;
11	23	19	13	18	8.5	11	23	11	13	7	12	12	17	2.1	5.7	0	11	13	9.4	11	23	18	21	15;
11	15	11	5.5	27	17	20	31	20	22	16	23	23	28	11	13	11	0	7.4	11	8	24	19	22	21;
13	18	14	8.8	29	79	21	32	21	23	17	22	22	27	12	14	13	7.4	0	9.8	6.8	23	18	21	20;
17	24	21	15	22	18	18	28	18	22	16	12	13	18	12	18	9.4	11	9.8	0	3.4	15	9.7	13	11;
14	21	18	12	29	19	22	33	21	24	18	15	15	20	13	15	11	8	6.8	3.4	0	17	11	15	14;
30	37	34	28	34	25	23	38	23	40	34	18	18	23	29	31	23	24	23	15	17	0	8	2.3	14;
25	32	28	23	31	21	20	35	20	34	28	15	14	21	24	25	18	19	18	9.7	11	8	0	6.1	11;
28	36	32	26	32	23	22	36	22	38	32	16	16	21	27	29	21	22	21	13	15	2.3	6.1	0	12;
27	34	31	25	21	14	12	22	12	23	18	6.8	6.9	9.8	18	21	15	21	20	11	14	14	11	12	0;
]
dib=[5	12	6.8	7.4	23	15	18	30	48	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	33	30;
5	12	6.8	7.4	23	15	18	30	48	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	33	30;
13	20	14	16	15	8.1	11	23	50	5.1	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	34	22;
13	20	14	16	15	8.1	11	23	50	5.1	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	34	22;
23	34	29	24	8.6	4.9	4.1	15	4.1	14	8.5	3.1	2.4	7.4	12	13	13	22	23	15	18	20	17	19	9.3;
16	27	23	14	23	13	14	24	14	17	11	7.4	8.1	13	6.3	9.8	4.2	14	13	5.5	6.9	19	14	18	11;
25	33	29	23	30	20	19	31	19	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	2.9	9.1;
25	33	29	23	30	20	19	31	19	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	2.9	9.1;
]
dibr=[5	12	6.8	7.4	23	15	18	30	48	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	33	30;
13	20	14	16	15	8.1	11	23	50	5.1	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	34	22;
23	34	29	24	8.6	4.9	4.1	15	4.1	14	8.5	3.1	2.4	7.4	12	13	13	22	23	15	18	20	17	19	9.3;
16	27	23	14	23	13	14	24	14	17	11	7.4	8.1	13	6.3	9.8	4.2	14	13	5.5	6.9	19	14	18	11;
25	33	29	23	30	20	19	31	19	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	2.9	9.1;
]
r=0
f=zeros(1,z)
temp1=dibr
cik=zeros(1,d)
while r~=z
    kol=min(temp1)
    for i=1:d
        for j=1:z
            if temp1(i,j)==kol
                for l=1:d
                    temp1(l,j)=1000*(temp1(l,j));
                end 
                cik(i)=cik(i)+1
                f(i,cik(i))=j
                r=r+1            
            end
        end
    end
end
disp(f)
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
function [kop,a,dis1,temp]=aisrule(a,kop)
    pest=1000*ones(1,pop)
    aa=a
    iter1=10
    rag1=zeros(iter1)
    ryg1=zeros(iter1)
    for io=1:iter1
        dix=zeros(pop,x)
        myg=zeros(1,pop)
        temt=zeros(pop,x)
        [lkop,kip,temt] =findmut(aa,kop)
        [aa]=mutate1(aa,kip,temt)
        [dix]=finddis(aa,kop)
        for i=1:pop
        myg(i)=sum(dix(i,:))
            if pest(i)>myg(i) then
                a(i,:)=aa(i,:)
                pest(i)=myg(i)
                dis1(i,:)=dix(i,:)
                kop(i,:)=lkop(i,:)
                temp(i,:)=temt(i,:)
            end
        end
        [kop,aa]=roulewheel1(dis1,a,kop)
        rag1(io)=min(pest)
        ryg1(io)=io
    end
    plot(ryg1,rag1)
endfunction
function [rkom,gog] =roulewheel1(dis,a,bkom)
    tdis=zeros(1,pop)
    pdis=zeros(1,pop)
    cdis=zeros(1,pop)
    calm=a
    gkom=bkom
    for i=1:pop
        tdis(i)=sum(dis(i,:))
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
                    calm(i,:)=a(j,:)
                    gkom(i,:)=bkom(j,:)
                    break
                end
            else
                
                if cdis(j-1)<jin & jin<=cdis(j)
                    calm(i,:)=a(j,:)
                    gkom(i,:)=bkom(j,:)
                    break
                end
            end
        end
    end
    rkom=gkom
    gog=calm
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
    kop=1+round((z-1)*rand(pop,(x-1)))
    [kop,a,dis1,temp]=aisrule(a,kop)
    [bkom,kip1,tempo] =findmut(c,bkom)
    [c]=mutate(c,kip1,tempo)
    [dis]=finddis(c,bkom)
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
namer=['CHEDIKULAM'	'URUPUMKUTTY'	'EDAPUZHA'	'EDOOR'	'KOLAYAD'	'VELLARVALLY'	'ARYAPARAMBA'	'PERUVA'    'KAPPAD'	'ATTENCHERY'	'PERAVOOR'	'MALOOR'	'THRIKADARIPOIL'	'THODEEKKALAM'	'EDATHOTTY'	'PALAPPUZHA'	'THALIPPOYIL'	'VATTIARA'	'PERUMPARAMBU'	'PADIKACHAL'	'PUNNAD'	'KODOLIPRAM'	'MARUTHAYI'	'VELLIYAMPARAMBA KSS LTD'	'KANHILERI'
]
bmc=["KEEZHPALLY" "KEEZHPALLY"  "ODEMTHODE" "ODEMTHODE" "THOLUMBRA" "THILLANKERI" "PAZHASSI RAJA NAGAR" "PAZHASSI RAJA NAGAR"
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









