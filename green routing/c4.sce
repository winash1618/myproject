clc
clear all
x=4
z=15
cap=[233	35	53	337	260	161	183	176	86	51	162	79	68	152	111]
//a=[14.0	3.0	1.0	2.0	4.0	5.0	6.0	15.0	7.0	8.0	9.0	11.0	13.0	10.0	12.0

//a=[6.0	5.0	4.0	1.0	2.0	3.0	14.0	8.0	7.0	15.0	10.0	13.0	11.0	9.0	12.0
a=[2	3	1	14	15	7	8	4	5	6	9	11	13	10	12

]  
//sizer=[7.0	0.0	0.0	8.0
sizer=[4	3	3	5
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
dis=zeros(1,x)
fis=zeros(1,x)
    ratio=zeros(1,x)
        po=zeros(x,z)
        jio=ones(1,x)
        
        i=1
        for k=1:x
            r=1
            while r<=sizer(1,k) & i<=z
                po(k,r)=a(1,i)
                r=r+1
                if i>z
                    break
                end
                i=i+1
            end
        end
        for k=1:x
            for i=1:z
                if i<sizer(1,k) & sizer(1,k)>1
                    jio(1,k)=jio(1,k)+cap(1,po(k,i))
                    dis(1,k)=dis(1,k)+tim(po(k,i),po(k,i+1))
                    fis(1,k)=fis(1,k)+0.249*tim(po(k,i),po(k,i+1))*jio(1,k)
                else
                    break
                end
            end
        end
        for k=1:x
            if sizer(1,k)>0     
                jio(1,k)=jio(1,k)+cap(1,po(k,sizer(1,k)))         
                dis(1,k)=dis(1,k)+dib(k,po(k,1))+dib(k,po(k,sizer(1,k)))
                fis(1,k)=fis(1,k)+0.249*dib(k,po(k,1))+0.249*dib(k,po(k,sizer(1,k)))*jio(1,k)
            end
        end
        for k=1:x
            vit=0
            for i=1:z
                if i<=sizer(1,k)
                    vit=vit+cap(po(k,i))
                end
            end
            if vit>0
                ratio(1,k)=(dis(1,k)*15)/vit
            end
        end
        disp("below is total distatnce")
disp(sum(dis))
disp("below is total distance covered by each vehicle")
disp(dis)
disp("below is this is capacity ratio for each vehicle")
disp(ratio)
disp(po)
disp("below is total carbon emission for each vehicle")
disp(fis)
disp("below is total carbon emission")
disp(sum(fis))
disp("below is route")
    sup=a
    gd=sizer
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
namer=['KARTHIKAPURAM'	'KARMALAGIRI KSS LTD'	'UDAYAGIRI'	'SREEPURAM'	'VIJAYAGIRI'	'OTTATHAI'	'THADIKADAVU'	'MEEMBATTY'	'KOONAM KSS'	'PADAPPENGAD'	'PANNIYOOR KSS'	'VILAKKANNUR'	'KALIKKADAVU'	'NEDUVODE'	'VIMALASSERY'

]
bmc=['ARANGAM'	'KOTTAYAD'	'VELLAD'	'NADUVIL'
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
