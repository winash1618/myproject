clc
clear
x=8
z=21
pop=10
iter=10000
a=zeros(pop,z)
rag=zeros(iter)
rag=zeros(iter)
bd=10000000*ones(1,pop)
gppd=zeros(pop,x)
cap=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	8	20
]
tim=[0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0	1;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	0;
]
dib=[1	1	1	1	1	1	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1	1	1	1	1	1	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1	1	1	1	1	1	1	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1	1	1	1	1	1	1	1000	1000	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1	1	1	1	1	1	1	1000	1000	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	1	1	1	1	1	1	1000	1000	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	1	1	1	1	1	1	1000	1000;
1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1	1	1	1	1	1	1;
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
function [bkop,grp,sis,kip] =finddis(a,bkom)
    temp=zeros(pop,x)
    tempo=zeros(pop,x)
    dis=zeros(pop,x)
    dis1=zeros(pop,x)
    rep=zeros(pop,z)
    rep1=zeros(pop,z)
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
        mik=1
        for k=1:x
            for i=1:z
                if po(k,i+1)~=0
                    dis(ka,k)=dis(ka,k)+tim(po(k,i),po(k,i+1))
                    if tim(po(k,i),po(k,i+1))>10
                        rep(ka,mik)=po(k,i)
                        
                    end
                    
                    mik=mik+1
                else
                    break
                end
            end
        end
        mik=1
        for k=1:x
            for i=1:z
                if po1(k,i+1)~=0
                    dis1(ka,k)=dis1(ka,k)+tim(po1(k,i),po1(k,i+1))
                    if tim(po1(k,i),po1(k,i+1))>10
                        rep1(ka,mik)=po1(k,i)
                    end
                    mik=mik+1
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
            rep1(ka,:)=rep(ka,:)
        end 
    end
    bkop=bkom
    grp=tempo
    sis=dis1
    kip=rep1
endfunction
function [n] = mutate(b,grd,kip)
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
        xio=rand(1,1)
        if xio<0.5
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
        for mi=1:x
            if kip(k,mi)~=0
                mut1=1+round((z-1)*rand(1,1))
                temper=b(k,mut1)
                b(k,mut1)=b(k,mi)
                b(k,mi)=temper
            end
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
function [rkom,glg,gog,kip] =roulewheel(dis,a,gpd,bkom,kip)
    tdis=zeros(1,pop)
    pdis=zeros(1,pop)
    cdis=zeros(1,pop)
    calm=a
    calp=gpd
    gkom=bkom
    jip=kip
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
                    jip(i,:)=kip(j,:)
                    break
                end
            else
                
                if cdis(j-1)<jin & jin<=cdis(j)
                    calm(i,:)=a(j,:)
                    calp(i,:)=gpd(j,:)
                    gkom(i,:)=bkom(j,:)
                    jip(i,:)=kip(j,:)
                    break
                end
            end
        end
    end
    rkom=gkom
    gog=calm
    glg=calp
    kip=jip
endfunction
toper=1000000
ygh=1
kip=zeros(pop,z)
esup=zeros(1,z)
egd=zeros(1,x)
bkom=1+round((z-1)*rand(pop,(x-1)))
bbom=zeros(pop,(x-1))
for y=1:iter
    [bkom,gp,dis,kip]=finddis(a,bkom)
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
    [bkom,gpd,a,kip]=roulewheel(dis,a,gpd,bkom,kip)
    [a]=mutate(a,gpd,kip)
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








