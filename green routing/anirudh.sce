clc
clear
a=round(1000*rand(50,180))+round(100*rand(50,180))
b=round(1000*rand(1,180))+round(100*rand(1,180))
c=(sum(b)+1000)/50
d=zeros(50,1)
e=zeros(50,1)
f=zeros(50,10)
r=0
while r~=180
    k=min(a)
    for i=1:50
         for j=1:180
            if a(i,j)==k
                 if e(i,1)<c
                    d(i,1)=d(i,1)+1
                    f(i,d(i,1))=j
                    e(i,1)=e(i,1)+b(1,j);
                    for l=1:50
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
