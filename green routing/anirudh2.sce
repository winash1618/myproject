clc
clear

dib=[5	12	6.8	7.4	23	15	18	48	12	14	23	22	29	15	9.3	15	13	16	22	19	35	30	35	33	30	35;
13	20	14	16	15	8.1	11	50	5.1	5.5	16	15	22	5.6	5.3	11	18	19	23	20	36	31	36	34	22	39;
23	34	29	24	8.6	4.9	4.1	4.1	14	8.5	3.1	2.4	7.4	12	13	13	22	23	15	18	20	17	18	19	9.3	23;
16	27	23	14	23	13	14	14	17	11	7.4	8.1	13	6.3	9.8	4.2	14	13	5.5	6.9	19	14	19	18	11	22;
25	33	29	23	30	20	19	19	35	29	13	13	18	21	26	18	19	18	10	12	4.7	3.3	6.5	2.9	9.1	7.5;
]
x=5
z=26
pop=10
r=0
temp1=dib
cik=zeros(1,x)
a=zeros(pop,z)
while r~=z
    kol=min(temp1)
    for i=1:x
        for j=1:z
            if temp1(i,j)==kol
                for l=1:x
                    temp1(l,j)=1000*(temp1(l,j));
                end 
                cik(i)=cik(i)+1
                f(i,cik(i))=j
                r=r+1            
            end
        end
    end
end
for i=1:pop
    io=1
    for k=1:x
        for j=1:cik(k)
            a(i,io)=f(k,j)
            io=io+1
        end
    end            
end

