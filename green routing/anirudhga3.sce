clc
clear
x=5
z=26
iter=5
bob=1000
se=zeros(1,iter)
vo=zeros(1,iter)
a=zeros(1,z)
cap=[288	95	115	133	107	22	34	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	15	8	20	29]
tim=[0	12	6.2	5.6	27	17	20	44	18	16	23	24	34	11	9	11	11	13	17	14	30	25	30	28	27	33;
12	0	5.2	9.9	39	29	32	52	29	27	34	36	46	23	20	23	15	18	24	21	37	32	37	36	34	37;
6.2	5.2	0	5.7	35	25	28	48	19	22	30	32	41	18	16	19	11	14	21	18	34	28	33	32	31	33;
5.6	9.9	5.7	0	29	19	22	42	19	17	26	26	36	13	10	13	5.5	8.8	15	12	28	23	28	26	25	27;
27	39	35	29	0	6.5	4.5	41	15	12	10	9.7	6.8	17	18	18	27	29	22	29	34	31	27	32	21	37;
17	29	25	19	6.5	0	2.9	35	9.6	3.7	7.6	6.9	12	7	8.3	8.5	17	79	18	19	25	21	22	23	14	28;
20	32	28	22	4.5	2.9	0	34	13	6.6	6.2	5.5	10	10	11	11	20	21	18	22	23	20	21	22	12	26;
44	52	48	42	41	35	34	0	54	6.6	6.2	5.5	10	10	11	11	20	21	18	21	23	20	21	22	12	26;
18	29	19	19	15	9.6	13	54	0	5.6	17	17	22	9.6	9.5	13	22	23	22	24	40	34	40	38	23	42;
16	27	22	17	12	3.7	6.6	6.6	5.6	0	11	11	19	5.6	6.8	7	16	17	16	18	34	28	34	32	18	36;
23	34	30	26	10	7.6	6.2	6.2	17	11	0	0.7	5.8	15	16	12	23	22	12	15	18	15	15	16	6.8	21;
24	36	32	26	9.7	6.9	5.5	5.5	17	11	0.7	0	5.1	14	15	12	23	22	13	15	18	14	15	16	6.9	21;
34	46	41	36	6.8	12	10	10	22	19	5.8	5.1	0	24	25	17	28	27	18	20	23	21	20	21	9.8	26;
11	23	18	13	17	7	10	10	9.6	5.6	15	14	24	0	5.2	2.1	11	12	12	13	29	24	29	27	18	32;
9	20	16	10	18	8.3	11	11	9.5	6.8	16	15	25	5.2	0	5.7	13	14	18	15	31	25	31	29	21	33;
11	23	19	13	18	8.5	11	11	13	7	12	12	17	2.1	5.7	0	11	13	9.4	11	23	18	23	21	15	26;
11	15	11	5.5	27	17	20	20	22	16	23	23	28	11	13	11	0	7.4	11	8	24	19	24	22	21	27;
13	18	14	8.8	29	79	21	21	23	17	22	22	27	12	14	13	7.4	0	9.8	6.8	23	18	23	21	20	19;
17	24	21	15	22	18	18	18	22	16	12	13	18	12	18	9.4	11	9.8	0	3.4	15	9.7	15	13	11	18;
14	21	18	12	29	19	22	21	24	18	15	15	20	13	15	11	8	6.8	3.4	0	17	11	16	15	14	19;
30	37	34	28	34	25	23	23	40	34	18	18	23	29	31	23	24	23	15	17	0	8	11	2.3	14	5;
25	32	28	23	31	21	20	20	34	28	15	14	21	24	25	18	19	18	9.7	11	8	0	8.3	6.1	11	6.4;
30	37	33	28	27	22	21	21	40	34	15	15	20	29	31	23	24	23	15	16	11	8.3	0	9.4	10	14;
28	36	32	26	32	23	22	22	38	32	16	16	21	27	29	21	22	21	13	15	2.3	6.1	9.4	0	12	5.1;
27	34	31	25	21	14	12	12	23	18	6.8	6.9	9.8	18	21	15	21	20	11	14	14	11	10	12	0	17;
33	37	33	27	37	28	26	26	42	36	21	21	26	32	33	26	27	19	18	19	5	6.4	14	5.1	17	0;
]
dib=[5	12	6.8	7.4	23	15	18	48	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	35	33	30	35;
13	20	14	16	15	8.1	11	50	5.1	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	36	34	22	39;
23	34	29	24	8.6	4.9	4.1	4.1	14	8.5	3.1	2.4	7.4	12	13	13	22	23	15	18	20	17	18	19	9.3	23;
16	27	23	14	23	13	14	14	17	11	7.4	8.1	13	6.3	9.8	4.2	14	13	5.5	6.9	19	14	19	18	11	22;
25	33	29	23	30	20	19	19	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	6.5	2.9	9.1	7.5;
]
best=zeros(x,z)
bval=1000
for i=1:z
      a(i)=i
end
for sim=1:200
for y=1:iter
    dis=zeros(1,x)
    po=zeros(x,z)
    mo=zeros(z,z,x)
    
    kom=1+round((z-1)*rand(1,(x-1)))
            
    i=1
    for k=1:x
        temp=0
        r=1
        while i<min(kom) & i<=z
            disp(min(kom))
            po(k,r)=a(i)
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
            disp(kom)
    end

    disp(po)
    for k=1:x
       i=1
       while po(k,i+1)~=0
          mo(po(k,i),po(k,i+1),k)=1
          i=i+1
       end    
    end
    for k=1:x
       for i=1:z
          for j=1:z
              dis(k)=dis(k)+tim(i,j)*mo(i,j,k)
          end
       end
    end
    for k=1:x
        temp=0
        for i=1:z
            if(po(k,i)~=0)
                temp=temp+1
           end
        end
        if temp>0
            dis(k)=dis(k)+dib(k,po(k,1))+dib(k,po(k,temp))
        end
    end
    disp(sum(dis))
    if(sum(dis)<bval)
        bval=sum(dis)
        sd=dis
        best=po
    end
    mut1=1+round((z-12)*rand(1,1))
    mut2=(z-12)+round(11*rand(1,1))
    temp=a(mut1)
    a(mut1)=a(mut2)
    a(mut2)=temp
    vo(y)=sum(dis)
    se(y)=y+1
end
plot(se,vo)
if bob>bval
    bob=bval
    beb=best
    bdb=sd
end
end



