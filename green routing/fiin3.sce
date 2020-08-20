clc
clear
x=4
z=15
pop=10
iter=10000
a=zeros(pop,z)
rag=zeros(iter)
rag=zeros(iter)
bd=10000*ones(1,pop)
gppd=zeros(pop,x)
cap=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	8	20
]
tim=[0	40	1.5	39	6.8	11	16	12	36	20	27	17	51	4.5	17;
40	0	42	9.1	43	38	33	39	51	41	48	45	21	34	33;
1.5	42	0	40	8.3	12	17	13	38	22	29	19	52	5.4	18;
39	9.1	40	0	41	36	32	38	42	40	42	43	12	32	32;
6.8	43	8.3	41	0	4.6	17	12	37	21	28	18	53	11	19;
11	38	12	36	4.6	0	13	7.8	32	16	23	13	49	11	15;
16	33	17	32	17	13	0	4.8	25	9	16	7.5	44	13	5;
12	39	13	38	12	7.8	4.8	0	24	8.2	15	6.7	50	12	9.8;
36	51	38	42	37	32	25	24	0	17	7.6	16	38	37	24;
20	41	22	40	21	16	9	8.2	17	0	8.4	5.9	43	21	8.5;
27	48	29	42	28	23	16	15	7.6	8.4	0	13	38	28	15;
17	45	19	43	18	13	7.5	6.7	16	5.9	13	0	48	18	13;
51	21	52	12	53	49	44	50	38	43	38	48	0	34	34;
4.5	34	5.4	32	11	11	13	12	37	21	28	18	34	0	11;
17	33	18	32	19	15	5	9.8	24	8.5	15	13	34	11	0;
]
dib=[6.8	33	8.3	32	9.2	4.6	9.2	5.8	30	14	21	11	44	6.6	9.9;
8.9	36	10	34	9.2	4.6	8	3.2	27	11	18	8.6	47	9.2	13;
15	42	16	41	15	11	10	5.6	27	14	21	8.6	53	15	15;
17	44	18	43	17	13	9.9	5.9	19	8.2	15	2.4	45	17	15;
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
disp (a)
best=a
function [bkop,grp,sis] =finddis(a,bkom)
    temp=zeros(pop,x)
    tempo=zeros(pop,x)
    dis=zeros(pop,x)
    dis1=zeros(pop,x)
    for ka=1:pop
        
        po=zeros(x,z)
        po1=zeros(x,z)        
        prob=rand(1,1)
        kop=1+round((z-1)*rand(1,(x-1)))
        if prob<0.4
            kom=kop
        end
        if ka==1
            kom=kop
        end
        i=1
        for k=1:x
            r=1
            while i<min(kom) & i<=z
                po(k,r)=a(ka,i)
                r=r+1
                if i<=z
                    i=i+1
                end
            end
            for g=1:x-1
                if kom(g)==min(kom)
                    kom(g)=100
                break
                end
            end
        end
        hkom=bkom(ka,:)
        i=1
        for k=1:x
            r=1
            while i<min(hkom) & i<=z
                po1(k,r)=a(ka,i)
                r=r+1
                if i<=z
                    i=i+1
                end
            end
            for g=1:x-1
                if hkom(g)==min(hkom)
                    hkom(g)=100
                break
                end
            end
        end
        kom=kop
        for k=1:x
            for i=1:z
                if po(k,i+1)~=0
                    dis(ka,k)=dis(ka,k)+tim(po(k,i),po(k,i+1))
                else
                    break
                end
            end
        end
        for k=1:x
            for i=1:z
                if po1(k,i+1)~=0
                    dis1(ka,k)=dis1(ka,k)+tim(po1(k,i),po1(k,i+1))
                else
                    break
                end
            end
        end
        for k=1:x
            for i=1:z
                if(po(k,i)~=0)
                    temp(ka,k)=temp(ka,k)+1
                    
                end
            end
            if temp(ka,k)>0
                dis(ka,k)=dis(ka,k)+dib(k,po(k,1))+dib(k,po(k,temp(ka,k)))
            end
        end
        for k=1:x
            for i=1:z
                if(po1(k,i)~=0)
                    tempo(ka,k)=tempo(ka,k)+1
                    
                end
            end
            if tempo(ka,k)>0
                dis1(ka,k)=dis1(ka,k)+dib(k,po1(k,1))+dib(k,po1(k,tempo(ka,k)))
            end
        end
        if sum(dis1(ka,:))>sum(dis(ka,:))
            dis1(ka,:)=dis(ka,:)
            bkom(ka,:)=kom
            tempo(ka,:)=temp(ka,:)
        end 
    end
    bkop=bkom
    grp=tempo
    sis=dis1
    
endfunction
function [n] = mutate(b,grd)
    gnd=ones(pop,x)
    for k=1:pop
    for i=1:x
        if i==1
            gnd(k,i)=0
        else
            gnd(k,i)=gnd(k,i-1)+grd(k,i-1)
        end
    end
    
    oll=rand(1,1)
    if oll<(y/iter) then
        r=1
        for i=1:x
            poll=rand(1,1)
            if i==1
                mut1=1+round((grd(k,i)-1)*rand(1,1))
                mut2=1+round((grd(k,i)-1)*rand(1,1))
                if poll<0.2 & mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    r=r+1
                end
            else
                mut1=gnd(k,i)+round((grd(k,i)-1)*rand(1,1))
                mut2=gnd(k,i)+round((grd(k,i)-1)*rand(1,1))
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
    end
    n=b
endfunction
function [nk] = supmut(b)
    for k=1:pop
                mut1=1+round((z-1)*rand(1,x))
                mut2=1+round((z-1)*rand(1,x))
        for i=1:x
                temper=b(k,mut2(1,i))
                b(k,mut2(1,i))=b(k,mut1(1,i))
                b(k,mut1(1,i))=temper    
        end 
    end
    nk=b
endfunction
function [rkom,glg,gog] =roulewheel(dis,a,gpd,bkom)
    tdis=zeros(1,pop)
    pdis=zeros(1,pop)
    cdis=zeros(1,pop)
    calm=a
    calp=gpd
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
                    calp(i,:)=gpd(j,:)
                    gkom(i,:)=bkom(j,:)
                    break
                end
            else
                
                if cdis(j-1)<jin & jin<=cdis(j)
                    calm(i,:)=a(j,:)
                    calp(i,:)=gpd(j,:)
                    gkom(i,:)=bkom(j,:)
                    break
                end
            end
        end
    end
    rkom=gkom
    gog=calm
    glg=calp
endfunction
toper=1000
esup=zeros(1,z)
egd=zeros(1,x)
bkom=1+round((z-1)*rand(pop,(x-1)))
bbom=zeros(pop,(x-1))
for y=1:iter
    [bkom,gp,dis]=finddis(a,bkom)
    mog=zeros(1,pop)
    for i=1:pop
        mog(i)=sum(dis(i,:))
        if mog(i)<bd(i) then
            best(i,:)=a(i,:)
            bd(i)=mog(i)
            gppd(i,:)=gp(i,:)
            bbom(i,:)=bkom(i,:)
        end
        if toper>bd(i) then
            toper=bd(i)
            esup=best(i,:)
            egd=gppd(i,:)
        end
        if round(sum(bd)/pop)-round(min(bd))<15 & y>1000
            if mog(i)<1.5*bd(i) then
                best(i,:)=a(i,:)
                bd(i)=mog(i)
                gppd(i,:)=gp(i,:) 
                bbom(i,:)=bkom(i,:)
            end
        end
    end
    rag(y)=min(bd)
    ryg(y)=y
    a=best
    gpd=gppd
    [bkom,gpd,a]=roulewheel(dis,a,gpd,bkom)
    [a]=mutate(a,gpd)
    if round(sum(bd)/pop)-round(min(bd))<6 & y>1000
        [a]=supmut(a)
    end 
end
plot(ryg,rag)
tomp=zeros(x)
        sup=esup
        gd=egd
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
namer=[	"KARTHIKAPURAM" "KARMALAGIRI KSS LTD" "UDAYAGIRI" "SREEPURAM" "VIJAYAGIRI" "OTTATHAI" "THADIKADAVU" "MEEMBATTY" "KOONAM KSS" "PADAPPENGAD" "PANNIYOOR KSS" "VILAKKANNUR" "KALIKKADAVU" "NEDUVODE" "VIMALASSERY"
]
bmc=["ARANGAM" "KOTTAYAD" "VELLAD" "NADUVIL"
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








