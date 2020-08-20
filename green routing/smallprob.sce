clc
clear
x=4
xo=2
z=5
pop=10
iter=1000
a=zeros(pop,z)
rag=zeros(iter)
rag=zeros(iter)
bd=10000*ones(1,pop)
gppd=zeros(pop,x)
cap=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	8	20
]
tim=[0	12	6.2	5.6	27;
12	0	5.2	9.9	39;
6.2	5.2	0	5.7	35;
5.6	9.9	5.7	0	13;
27	39	35	29	0;
]

dib=[5	12	6.8	7.4	23;
13	20	14	16	15;

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
function [reb]=findveh(reb)
    while sum(reb)<x
        for j=1:xo
            
            polo=rand(1,1)
            if polo<0.5
                reb(j)=reb(j)+1
            end
            if sum(reb)==x
                    break
            end
        end
    end
endfunction
function [veb1,bkop,grp,sis] =finddis(a,bkom,veb)
    temp=zeros(pop,x)
    tempo=zeros(pop,x)
    dis=zeros(pop,x)
    dis1=zeros(pop,x)
    veh1=veb
    veh2=zeros(pop,xo)
    for i=1:pop
        geb=veh2(i,:)
        [geb]=findveh(geb)
        veh2(i,:)=geb
    end
    veh=veh2
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
                if i~=z
                if po(k,i+1)~=0 
                    dis(ka,k)=dis(ka,k)+tim(po(k,i),po(k,i+1))
                else
                    break
                end
                end
            end
        end
        for k=1:x
            for i=1:z
                if i~=z
                if po1(k,i+1)~=0 
                    dis1(ka,k)=dis1(ka,k)+tim(po1(k,i),po1(k,i+1))
                else
                    break
                end
                end
            end
        end
        neh=1
        k=1
        for neh=1:xo
            while veh(ka,neh)~=0
                veh(ka,neh)=veh(ka,neh)-1
                for i=1:z
                    if(po(k,i)~=0)
                        temp(ka,k)=temp(ka,k)+1
                    end
                end
                if temp(ka,k)>0
                    dis(ka,k)=dis(ka,k)+dib(neh,po(k,1))+dib(neh,po(k,temp(ka,k)))
                end 
                k=k+1
            end
        end
        neh=1
        k=1
        for neh=1:xo
            while veh1(ka,neh)~=0
                veh1(ka,neh)=veh1(ka,neh)-1
                for i=1:z
                if(po1(k,i)~=0)
                    tempo(ka,k)=tempo(ka,k)+1
                end
                end
                if tempo(ka,k)>0
                dis1(ka,k)=dis1(ka,k)+dib(neh,po1(k,1))+dib(neh,po1(k,tempo(ka,k)))
                end 
            k=k+1
            end
        end
        veh1=veb
        veh=veh2
        if sum(dis1(ka,:))>sum(dis(ka,:))
            dis1(ka,:)=dis(ka,:)
            bkom(ka,:)=kom
            tempo(ka,:)=temp(ka,:)
            veh1(ka,:)=veh(ka,:)
        end 
    end
    bkop=bkom
    grp=tempo
    sis=dis1
    veb1=veh1
    
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
    if oll<0.8 then
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
function [keb,rkom,glg,gog] =roulewheel(dis,a,gpd,bkom,bveb)
    tdis=zeros(1,pop)
    pdis=zeros(1,pop)
    cdis=zeros(1,pop)
    calm=a
    calp=gpd
    gkom=bbom
    keb1=bveb
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
                    gkom(i,:)=bbom(j,:)
                    keb1(i,:)=bveb(j,:)
                    break
                end
            else
                
                if cdis(j-1)<jin & jin<=cdis(j)
                    calm(i,:)=a(j,:)
                    calp(i,:)=gpd(j,:)
                    gkom(i,:)=bbom(j,:)
                    keb1(i,:)=bveb(j,:)
                    break
                end
            end
        end
    end
    rkom=gkom
    gog=calm
    glg=calp
    keb=keb1
endfunction
toper=1000
esup=zeros(1,z)
egd=zeros(1,x)
eveb=zeros(1,x)
bkom=1+round((z-1)*rand(pop,(x-1)))
bbom=zeros(pop,(x-1))
veb=zeros(pop,xo)
bveb=zeros(pop,xo)
for i=1:pop
    geb=veb(i,:)
    [geb]=findveh(geb)
    veb(i,:)=geb
end
rl=1
for y=1:iter
    [veb,bkom,gp,dis]=finddis(a,bkom,veb)
    mog=zeros(1,pop)
    for i=1:pop
        mog(i)=sum(dis(i,:))
        if mog(i)<bd(i) then
            best(i,:)=a(i,:)
            bd(i)=mog(i)
            gppd(i,:)=gp(i,:)
            bbom(i,:)=bkom(i,:)
            bveb(i,:)=veb(i,:)
        end
        if toper>bd(i) then
            toper=bd(i)
            esup=best(i,:)
            egd=gppd(i,:)
            eveb=bveb(i,:)
        end
    end
    rag(y)=min(bd)
    ryg(y)=y
    a=best
    gpd=gppd
    [veb,bkom,gpd,a]=roulewheel(dis,a,gpd,bbom,bveb)
    [a]=mutate(a,gpd)
    if round(sum(bd)/pop)-round(min(bd))<15 & y>1000
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
namer=['CHEDIKULAM'	'URUPUMKUTTY'	'EDAPUZHA'	'EDOOR'	'KOLAYAD'
]
bmc=["KEEZHPALLY"  "ODEMTHODE"  ]
yum=0
r=1
disp (fine)
for i=1:xo
        while eveb(i)~=0
            j=1
            while fine(r,j)>0
                if j==1 
                    disp(bmc(i))
                    disp(dib(i,fine(r,j)))
                    yum=yum+dib(i,fine(r,j))
                end
                disp(namer(fine(r,j)))
                if j~=gd(r) then
                    disp(tim(fine(r,j),fine(r,j+1)))
                    yum=yum+tim(fine(r,j),fine(r,j+1))
                end
                if j==gd(r)
                    disp(dib(i,fine(r,j)))
                    yum=yum+dib(i,fine(r,j))
                    disp(bmc(i))
                end
                j=j+1
                if(j>z)
                    break
                end
            end
            
            r=r+1
            eveb(i)=eveb(i)-1
        end
end
disp(yum)








