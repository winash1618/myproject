clc
clear
x=5
bis=[0.0	12.0	6.2	5.6	27.0;
12.0	0.0	5.2	9.9	39.0;
6.2	5.2	0.0	5.7	35.0;
5.6	9.9	5.7	0.0	29.0;
27.0    39.0	35.0	29.0	0.0;
]
disp(bis)
ferm=bis
for i=1:x
    temp=sum(bis(i,:))
    for j=1:x
        ferm(i,j)=bis(i,j)/temp
    end   
end
cum=ferm
for i=1:x
    for j=1:x
        if j==1
            cum(i,j)=ferm(i,j)
        else
            cum(i,j)=cum(i,j-1)+ferm(i,j)
        end
    end
end
disp(cum)
hope=1+(x-1)*round(rand(1,1))
seq=zeros(1,x)
for i=1:x
    if i==1
        seq(i)=hope
    else
        temp=rand(1,1)
        for j=1:x
            if j==1
                if temp<cum(seq(i-1),j)
                    seq(i)=j
                end
            else
                if cum(seq(i-1),j-1)<temp & temp<cum(seq(i-1),j)
                    seq(i)=j
                end
            end
        end
    end
end
disp(seq)
