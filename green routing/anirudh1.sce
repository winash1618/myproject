clc
clear

a=[5	12	6.8	7.4	23	15	18	48	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	35	33	30	35;
13	20	14	16	15	8.1	11	50	5.1	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	36	34	22	39;
23	34	29	24	8.6	4.9	4.1	4.1	14	8.5	3.1	2.4	7.4	12	13	13	22	23	15	18	20	17	18	19	9.3	23;
16	27	23	14	23	13	14	14	17	11	7.4	8.1	13	6.3	9.8	4.2	14	13	5.5	6.9	19	14	19	18	11	22;
25	33	29	23	30	20	19	19	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	6.5	2.9	9.1	7.5;
]
temp=a
b=[288	95	115	133	107	22	34	28	186	190	33	56	100	90	82	143	68	166	44	73	72	60	68	15	8	20	29	18
]
c=(sum(b)+5000)/5
d=zeros(5,1)
e=[556;
413;
169;
205;
305;
]
f=zeros(5,10)
r=0
while r~=28
    k=min(a)
    for i=1:5
         for j=1:28
            if a(i,j)==k
                 if e(i,1)<c
                    d(i,1)=d(i,1)+1
                    f(i,d(i,1))=j
                    e(i,1)=e(i,1)+b(1,j);
                    for l=1:5
                        a(l,j)=1000*(a(l,j));
                    end 
                    r=r+1
                else
                    a(i,j)=1000*(a(i,j));
                end
            

            end
        end
    end
end
dom=zeros(5,1)
for i=1:5
    for j=1:10
        if f(i,j)~=0
             dom(i,1)=dom(i,1)+temp(i,f(i,j))
        end
    end
end
f1=[1 2 3 4 0 0 0 0 0 0;
5 6 7 8 9 10 11 0 0 0;
12 13 14 26 0 0 0 0 0 0;
15 16 17 18 0 0 0 0 0 0;
19 20 21 22 23 24 25 27 28 0;]
dom1=zeros(5,1)
for i=1:5
    for j=1:10
        if f1(i,j)~=0
             dom1(i,1)=dom1(i,1)+temp(i,f1(i,j))
        end
    end
end
