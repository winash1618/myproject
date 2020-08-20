clc
clear
x=8
z=25
iter=1000
a=zeros(1,z)
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
for i=1:z
    c(1,i)=1
end
jeep=ones(z,z)
heep=ones(x,z)
best=200
bb=100*ones(x,z)
bb1=100*ones(x,1)
for ka=1:1000000
        b=c
        dkom=1+round((z-1)*rand(1,(x-1)))
        cc=100*ones(x,z)
        cc1=100*ones(x,1)
        ckom=dkom
        sizer=zeros(1,x)
        for i=1:x
            if i==1
                sizer(1,i)=min(ckom)
                for g=1:x-1
                    if ckom(g)==min(ckom)
                        ckom(g)=100
                        break
                    end
                end
            elseif i==x
                sizer(1,i)=z-sum(sizer)
            else
                sizer(1,i)=min(ckom)-sum(sizer)
                for g=1:x-1
                    if ckom(g)==min(ckom)
                        ckom(g)=100
                        break
                    end
                end
            end 
        end
        po=zeros(x,z)
        klop=zeros(1,z)
        for k=1:x
            for i=1:sizer(1,k)
                if i==1
                    for j=1:z
                        klop(1,j)=b(1,j)*heep(k,j)
                        if klop(1,j)==0
                            klop(1,j)=10000000*100000000000000000
                        end
                    end
                    for j=1:z
                        if klop(1,j)==min(klop)
                            b(1,j)=0
                            temp=j
                            break
                        end
                    end
                    po(k,i)=temp
                elseif i==sizer(1,k)
                    for j=1:z
                        klop(1,j)=b(1,j)*heep(k,j)
                        if klop(1,j)==0
                            klop(1,j)=10000000*100000000000000
                        end
                    end
                    for j=1:z
                        if klop(1,j)==min(klop) & klop(1,j)~=0
                            b(1,j)=0
                            temp=j
                            break
                        end
                    end
                    po(k,i)=temp
                else
                    for j=1:z
                        klop(1,j)=b(1,j)*jeep(k,j)
                        if klop(1,j)==0
                            klop(1,j)=10000000*100000000000000
                        end
                    end
                    for j=1:z
                        if klop(1,j)==min(klop)
                            b(1,j)=0
                            temp=j
                            break
                        end
                    end
                    po(k,i)=temp
                end
            end
        end
        dis2=zeros(1,x)
        for k=1:x
            for i=1:z
                if po(k,i+1)~=0 
                    dis2(1,k)=dis2(1,k)+tim(po(k,i),po(k,i+1))
                    cc(k,i+1)=tim(po(k,i),po(k,i+1))
                else
                    break
                end
            end
        end
        tempi=zeros(1,x)
        for k=1:x
            for i=1:z
                if(po(k,i)~=0)
                    tempi(1,k)=tempi(1,k)+1
                end
            end
            if tempi(1,k)>0              
                dis2(1,k)=dis2(1,k)+dib(k,po(k,1))+dib(k,po(k,tempi(1,k)))
                cc1(k,1)=dib(k,po(k,tempi(1,k)))
                cc(k,1)=dib(k,po(k,1))
            end
        end
        dis=sum(dis2)
        for i=1:x
            for j=1:z
                if dis>best
                    if  po(i,j)~=0
                        if j==1 
                            
                            heep(i,po(i,j))=heep(i,po(i,j))+100*dib(i,po(i,j))
                        elseif j==sizer(1,i)
                            heep(i,po(i,j))=heep(i,po(i,j))+100*dib(i,po(i,j))
                        else
                            jeep(po(i,j-1),po(i,j))=jeep(po(i,j-1),po(i,j))+100*tim(po(i,j-1),po(i,j))
                        end
                   end
               else
                   if  po(i,j)~=0
                       best=dis
                       gt=po
                        if j==1
                            if cc(i,j)<=10
                            heep(i,po(i,j))=heep(i,po(i,j))-1000*dib(i,po(i,j))
                            bb(i,j)=cc(i,j)
                            elseif cc(i,j)>bb(i,j)
                            heep(i,po(i,j))=heep(i,po(i,j))+100*dib(i,po(i,j))
                            end
                        elseif j==sizer(1,i)
                            if cc1(i,1)<=bb1(i,1)
                            heep(i,po(i,j))=heep(i,po(i,j))-1000*dib(i,po(i,j))
                            bb1(i,1)=cc1(i,1)
                            elseif cc1(i,1)>bb1(i,1)
                            heep(i,po(i,j))=heep(i,po(i,j))+100*dib(i,po(i,j))
                            end
                        else
                            if cc(i,j)<=bb(i,j)
                            jeep(po(i,j-1),po(i,j))=jeep(po(i,j-1),po(i,j))-1000*tim(po(i,j-1),po(i,j))
                            bb(i,j)=cc(i,j)
                            elseif cc(i,j)>bb(i,j)
                            jeep(po(i,j-1),po(i,j))=jeep(po(i,j-1),po(i,j))+100*tim(po(i,j-1),po(i,j))
                            end
                        end
                   end
               end
           end
        end
        for i=1:z
            for j=1:z
                if i==j
                    jeep(i,j)=max(jeep)
                end
            end
        end
        
        disp(dis)
end

