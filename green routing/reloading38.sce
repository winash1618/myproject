clc
clear
x=8
z=25
pop=10
iter=10000
a=zeros(pop,z)
rag=zeros(iter)
rag=zeros(iter)
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
function [grp,sis,fis] =finddis(a,bkom)
    temp=zeros(pop,x)
    dis=zeros(pop,x)
    fis=zeros(pop,x)
    for ka=1:pop
        
        po=zeros(x,z)
        kom=bkom(ka,:)
        kos=kom
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
        kom=kos
        //disp(bkom(ka,:))
        //disp(po)
        jio=ones(1,x)
        for k=1:x
            for i=1:z
                if i~=25
                    if po(k,i+1)~=0 
                        jio(1,k)=jio(1,k)+cap(1,po(k,i))
                        dis(ka,k)=dis(ka,k)+tim(po(k,i),po(k,i+1))
                        fis(ka,k)=fis(ka,k)+0.249*tim(po(k,i),po(k,i+1))*jio(1,k)
                    end
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
                jio(1,k)=jio(1,k)+cap(1,po(k,temp(ka,k)))
                dis(ka,k)=dis(ka,k)+dib(k,po(k,1))+dib(k,po(k,temp(ka,k)))
                fis(ka,k)=fis(ka,k)+0.249*dib(k,po(k,1))+0.249*dib(k,po(k,temp(ka,k)))*jio(1,k)
            end
        end
    end
    grp=temp
    sis=dis
    //disp(jio)
endfunction
function [n,bkom] = mutate(b,grd,bkom)
    c=b
    //disp(bkom)
    gnd=ones(pop,x)
    for k=1:pop
        for i=1:x
            if i==1
                gnd(k,i)=0
            else
                gnd(k,i)=gnd(k,i-1)+grd(k,i-1)
            end
        end
        //disp(gpd)
        for i=1:x
            if i==1 & grd(k,i)>1
                mut1=1+round((grd(k,i)-1)*rand(1,1))
                too=grd(k,i)-mut1
                noo=mut1-1
                if too>noo
                    mut2=mut1+1+round((too-1)*rand(1,1))
                else
                    mut2=mut1-1-round((noo-1)*rand(1,1))
                end
                //disp("aaa",mut1,mut2,"aaa")
                if mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    //disp("a1")
                end
            elseif grd(k,i)>1
                mut1=gnd(k,i)+round((grd(k,i)-1)*rand(1,1))+1
                too=gnd(k,i)+grd(k,i)-mut1
                noo=mut1-gnd(k,i)-1
                if too>noo
                    mut2=mut1+1+round((too-1)*rand(1,1))
                else
                    mut2=mut1-1-round((noo-1)*rand(1,1))
                end
                //disp("aaa1",mut1,mut2,"aaa1")
                //if mut2<grd(k,i) & mut2<gnd(k,i)+1
                    
                if mut1>0 & mut2>0 & mut1~=mut2
                    temper=b(k,mut2)
                    b(k,mut2)=b(k,mut1)
                    b(k,mut1)=temper
                    //disp("a2")
                end   
            end
        end
    end
    //disp(b)
    [gp1,dis1,fis1]=finddis(b,bkom)
    [gp2,dis2,fis2]=finddis(c,bkom)
    //disp("d",dis1,fis1,"d","a",dis2,fis2,"a")
    //disp(gp1,gp2,grd)
    for k=1:pop
        t=0
        for i=1:x
            if dis1(k,i)<dis2(k,i)
                if fis1(k,i)<fis2(k,i)
                    if i==1 & grd(k,i)>1
                        for j=1:grd(k,i)
                            c(k,j)=b(k,j)
                            t=t+1
                        end
                    elseif grd(k,i)>1
                        for j=gnd(k,i)+1:gnd(k,i)+grd(k,i)
                            
                            c(k,j)=b(k,j)
                            //disp(gnd(k,i)+1,gnd(k,i)+grd(k,i),c,b)
                            t=t+1
                        end
                        //disp(k,gnd(k,i)+1,gnd(k,i)+grd(k,i),c,b)
                    end
                end
            end
        end
        if t==0
            bkom(k,:)=1+round((z-1)*rand(1,(x-1)))
        end
    end
    //disp("ddd",b,"dd",c,"df")
    n=c
endfunction
function [dis] =finddis1(a,siz)
    dis=zeros(pop,x)
    fis=zeros(pop,x)
    for ka=1:pop
        po=zeros(x,z)
        sizer=siz(ka,:)
        i=1
        for k=1:x
            r=1
            while r<=sizer(1,k) & i<=z
                po(k,r)=a(ka,i)
                r=r+1
                if i>z
                    break
                end
                i=i+1
            end
        end
        //disp(po)
        jio=ones(1,x)
        for k=1:x
            //disp("A",sizer(1,k),sizer,"A")
            //disp(po(k,:))
            for i=1:z
                if i<sizer(1,k) & sizer(1,k)>1
                    //disp(k)
                    jio(1,k)=jio(1,k)+cap(1,po(k,i))
                    dis(ka,k)=dis(ka,k)+tim(po(k,i),po(k,i+1))
                    fis(ka,k)=fis(ka,k)+0.249*tim(po(k,i),po(k,i+1))*jio(1,k)
                else
                    break
                end
            end
        end
        for k=1:x
            if siz(ka,k)>0 
                jio(1,k)=jio(1,k)+cap(1,po(k,sizer(1,k)))             
                dis(ka,k)=dis(ka,k)+dib(k,po(k,1))+dib(k,po(k,sizer(1,k)))
                fis(ka,k)=fis(ka,k)+0.249*dib(k,po(k,1))+0.249*dib(k,po(k,temp(ka,k)))*jio(1,k)
            end
        end
    end
endfunction
function [rkom,glg,gog] =roulewheel(dis,a,gpd,bkom)
    tdis=zeros(1,2*pop)
    pdis=zeros(1,2*pop)
    cdis=zeros(1,2*pop)
    calm=zeros(pop,z)
    calp=zeros(pop,x)
    gkom=zeros(pop,x-1)
    //disp(dis)
    for i=1:2*pop
        tdis(i)=dis(i)
    end
    for i=1:2*pop
        pdis(i)=tdis(i)/(sum(tdis))
    end
    for i=1:2*pop
        if i==1
            cdis(i)=cdis(i)+pdis(i)
        else
            cdis(i)=cdis(i-1)+pdis(i)
        end
    end
    //disp(cdis)
    for i=1:pop
        jin=rand(1,1)
        for j=1:2*pop
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
fis2=zeros(pop,x)
bbom=zeros(pop,(x-1))
gpd=zeros(pop,x)
ratio=zeros(pop,x)
for y=1:iter
    //disp(bkom)
        //bkom=1+round((z-1)*rand(pop,(x-1)))
    [gp,dis,fis2]=finddis(a,bkom)
    mog=zeros(1,pop)
    mig=zeros(1,pop)
    mug=ones(1,2*pop)
    mug1=ones(1,pop)
    for i=1:pop
        mog(i)=sum(dis(i,:))
        mig(i)=sum(fis2(i,:))
    end
    vu=zeros(2*pop,z)
    vu1=zeros(2*pop)
    vu2=zeros(2*pop)
    vu3=zeros(2*pop,x)
    vu4=zeros(2*pop,x-1)
    //disp(gp,gpd)
    for i=1:pop
        vu(i,:)=a(i,:)
        vu1(i)=mog(i)
        vu2(i)=mig(i)
        vu3(i,:)=gp(i,:)
        vu4(i,:)=bkom(i,:)
    end
    if y==1
        best=a
        mog1=mog
        mig1=mig
        gpd=gp
        bbom=bkom
    end
    for i=pop+1:2*pop
        vu(i,:)=best(i-pop,:)
        vu1(i)=mog1(i-pop)
        vu2(i)=mig1(i-pop)
        vu3(i,:)=gpd(i-pop,:)
        vu4(i,:)=bbom(i-pop,:)
    end
    for i=1:2*pop
        for j=1:2*pop
            if vu1(i)<vu1(j)
                if vu2(i)<vu2(j)
                    mug(i)=mug(i)+3
                elseif vu2(i)>=vu2(j)
                    mug(i)=mug(i)+1
                end
            elseif vu1(i)>vu1(j)
                if vu2(i)<=vu2(j)
                    mug(i)=mug(i)+1
                end
            end
        end
    end
    //disp(mug,vu,vu1,vu2,vu3,vu4)
    mug2=mug
    for i=1:pop
        for j=1:2*pop
            if mug(j)==max(mug)
                best(i,:)=vu(j,:)
                mog1(i)=vu1(j)
                mig1(i)=vu2(j)
                gpd(i,:)=vu3(j,:)
                bbom(i,:)=vu4(j,:)
                mug1(i)=mug(j)
                mug(j)=0
                break
            end
        end
        if mig1(i)<20000
            esup=best(i,:)
            egd=gpd(i,:)
            total=mig1(i)
        end
    end
    //disp(bbom,gpd)
    //disp(mug,mug1,mog1,mig1)
    //a=best
    //gp=gpd
    //bkom=bbom
    rag(y)=min(mog1)
    ryg(y)=min(mig1)
    //disp(bkom,gp)
    [bkom,gp,a]=roulewheel(mug2,vu,vu3,vu4)
    //disp(bkom,gp,a)
    [a,bkom]=mutate(a,gp,bkom)
end
plot(ryg,rag)
for ii=1:pop
    sup=best(ii,:)
    gd=gpd(ii,:)
tomp=zeros(x)
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
end








