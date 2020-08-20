clc
clear
x=4
z=15
pop=10
iter=30000
a=zeros(pop,z)
rag=zeros(iter)
rag=zeros(iter)
cap=[233	35	53	337	260	161	183	176	86	51	162	79	68	152	111

]
tim=[0	6.6	1.5	3.4	6.8	11	16	12	33	20	27	17	23	4.5	17;
6.6	0	5.1	10	13	18	23	17	43	26	34	24	30	11	23;
1.5	5.1	0	4.9	8.3	12	17	13	35	22	29	19	25	5.4	18;
3.4	10	4.9	0	6.7	14	19	14	40	23	31	21	27	7.9	20;
6.8	13	8.3	6.7	0	4.6	17	12	33	21	28	18	24	11	19;
11	18	12	14	4.6	0	13	7.8	29	16	23	13	19	11	15;
16	23	17	19	17	13	0	4.8	25	9	16	7.5	12	13	5;
12	17	13	14	12	7.8	4.8	0	24	8.2	15	6.7	14	12	9.8;
33	43	35	40	33	29	25	24	0	17	7.6	16	11	34	24;
20	26	22	23	21	16	9	8.2	17	0	8.4	5.9	3.5	21	8.5;
27	34	29	31	28	23	16	15	7.6	8.4	0	13	2	28	15;
17	24	19	21	18	13	7.5	6.7	16	5.9	13	0	6.2	18	13;
23	30	25	27	24	19	12	14	11	3.5	2	6.2	0	24	12;
4.5	11	5.4	7.9	11	11	13	12	34	21	28	18	24	0	11;
17	23	18	20	19	15	5	9.8	24	8.5	15	13	12	11	0;

]
dib=[6.8	14.7	8.3	9.9	9.2	4.6	9.2	5.8	27	14	21	11	17	6.6	9.9;
8.9	15	10	12	9.2	4.6	8	3.2	24	11	18	8.6	15	9.2	13;
15	22	16	17.6	15	11	10	5.6	24	14	21	8.6	15	15	15;
17	23	18	20	17	13	9.9	5.9	19	8.2	15	2.4	8.6	17	15;

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
cad=rand(pop,z)
best=a
for i=1:pop
    for j=1:z
        for k=1:z
            if cad(i,k)==min(cad(i,:))
                best(i,j)=k
                cad(i,k)=10000
                break
            end
        end
    end
end 
kii=zeros(1,x)
for i=1:x
    for j=1:z
        if dib(i,j)<=15
            kii(1,i)=kii(1,i)+1
            kio(i,kii(1,i))=j
        end
    end
    if x==4
        kii(1,i)=kii(1,i)+1
        kio(i,kii(1,i))=9
    end
end


disp (a)
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
                if i~=z
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
    end
    for k=1:pop
        //disp(gpd)
        r=0
                for i=1:x
                    if i==1 & grd(k,i)>1
                        mut1=1+round((grd(k,i)-1)*rand(1,1))
                        mu2=1+round((kii(1,i)-1)*rand(1,1))
                        mut2=kio(i,mu2)
                        prob=rand(1,1)
                        if prob<0.2
                        for i=1:z
                            if b(k,i)==mut2
                                //disp(c(k,i),c(k,:),mut1)
                                temper= b(k,i)
                                b(k,i)=b(k,mut1)
                                b(k,mut1)=temper
                                r=1
                                break
                            end
                        end
                        end
                    elseif grd(k,i)>1
                        mut1=gnd(k,i)+round((grd(k,i)-1)*rand(1,1))+1
                        mu2=1+round((kii(1,i)-1)*rand(1,1))
                        mut2=kio(i,mu2)
                        prob=rand(1,1)
                        if prob<0.2
                            for i=1:z
                                if b(k,i)==mut2
                                //disp(c(k,mut1))
                                temper= b(k,i)
                                b(k,i)=b(k,mut1)
                                b(k,mut1)=temper
                                r=1
                                break
                                end
                            end 
                        end
                    end
                    if r==1
                        break
                    end
                end
     end
           c=b 
     for k=1:pop
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
    p=0
    for k=1:pop
        t=0
        for i=1:x
            //if dis1(k,i)<dis2(k,i)
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

            //end
        end
        end
        prob=rand(1,1)
        if t==0 & prob<=0.7
            bkom(k,:)=1+round((z-1)*rand(1,(x-1)))
            //c(k,:)=b(k,:)
            p=p+1
        end
            //c(k,:)=b(k,:)
            
    end
    //disp(p)
    if p==0 then
        [c,bkom]=mutate(c,grd,bkom)
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
total=10000
toper=210
esup=zeros(1,z)
egd=zeros(1,x)
bkom=1+round((z-1)*rand(pop,(x-1)))
fis2=zeros(pop,x)
bbom=zeros(pop,(x-1))
gpd=zeros(pop,x)
ratio=zeros(pop,x)
koo=3
p=1
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
        [gpd,dis1,fis3]=finddis(best,bkom)
        for i=1:pop
            mog1(i)=sum(dis1(i,:))
            mig1(i)=sum(fis3(i,:))
        end
        bbom=bkom
    end
    for i=pop+1:2*pop
        vu(i,:)=best(i-pop,:)
        vu1(i)=mog1(i-pop)
        vu2(i)=mig1(i-pop)
        vu3(i,:)=gpd(i-pop,:)
        vu4(i,:)=bbom(i-pop,:)
    end
    if koo==3
    for i=1:2*pop
        for j=1:2*pop
            if vu1(i)<vu1(j)
                //if vu2(i)<vu2(j)
                    mug(i)=mug(i)+1
                //end
            end
        end
    end
    for i=1:2*pop
        for j=1:x
            if vu3(i,j)==0
                //if vu2(i)<vu2(j)
                    mug(i)=mug(i)-0.3*mug(i)
                //end
            end
        end
    end
    end
    disp(sum(mog1)/pop,max(mog1))
    if round(sum(mog1)/pop)==round(max(mog1))
        p=p+1
        if p>=300
            koo=1
        end
    end
    if  koo<3
        for i=1:2*pop
        for j=1:2*pop
            if vu1(i)>vu1(j)
                //if vu2(i)<vu2(j)
                    mug(i)=mug(i)+1
                //end
                disp("f")
            end
        end
    end
    koo=koo+1
    p=1
    end
    //disp(mug,vu,vu1,vu2,vu3,vu4)
    mug2=mug
    for i=1:pop
        for j=1:2*pop
            if mug(j)==max(mug)
                best(i,:)=vu(j,:)
                mog1(i)=vu1(j)
                mig1(i)=vu2(j)
                //disp(gpd)
                gpd(i,:)=vu3(j,:)
                if koo==2
                    disp(gpd)
                end
                bbom(i,:)=vu4(j,:)
                mug1(i)=mug(j)
                mug(j)=0
                break
            end
        end
        if mog1(i)<toper
            esup=best(i,:)
            egd=gpd(i,:)
            total=mig1(i)
            toper=mog1(i)
        end
    end
    for i=1:2*pop
        if mug2(i)>10
            mug2(i)=mug2(i)
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
    //disp(a)
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








