clc
clear all
x=8
z=25
cap=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	8	20]
a=[3.0	2.0	19.0	18.0	4.0	1.0	9.0	10.0	7.0	6.0	11.0	16.0	5.0	8.0	14.0	12.0	13.0	15.0	17.0	25.0	20.0	21.0	23.0	24.0	22.0



]  
sizer=[2.0	4.0	2.0	4.0	5.0	2.0	4.0	2.0



]  
tim=[0	5.9	6.2	5.6	27	17	20	29	19	18	16	23	24	34	11	9	11	11	13	17	14	30	25	28	27;
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
dib=[5	6.7	6.8	7.4	23	15	18	30	15	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	33	30;
5	6.7	6.8	7.4	23	15	18	30	15	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	33	30;
13	14	14	16	15	8.1	11	23	4.7	2.8	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	34	22;
13	14	14	16	15	8.1	11	23	4.7	2.8	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	34	22;
23	27	29	24	8.6	4.9	4.1	15	14	14	8.5	3.1	2.4	7.4	12	13	13	22	23	15	18	20	17	19	9.3;
16	23	23	14	23	13	14	24	17	17	11	7.4	8.1	13	6.3	9.8	4.2	14	13	5.5	6.9	19	14	18	11;
25	28	29	23	30	20	19	31	31	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	2.9	9.1;
25	28	29	23	30	20	19	31	31	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	2.9	9.1;
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
