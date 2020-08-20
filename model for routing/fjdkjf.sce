clc
clear

function c=z1(x)
    alpha=30
    betaa=100
    theta=1
    omega=5
    w=50
    l=250
    p=1
    c=(alpha+(betaa/(((phi*sin(gama*x)+delta)^theta)+omega)))*(phi*sin(gama*x)+delta)*(1+p*(w/l))
endfunction
in=zeros(1,1000)
in1=zeros(1,1000)
in2=in
in3=in
phi=70
delta=80
d=40
gama=0.5
for i=6.3:1:12.4
    //in3(1,i*10)=z1(i)
    //if in3(1,i*10)<0.1 & in3(1,i*10)>-0.1
        //disp (i)
    //end
    disp(phi*sin(gama*i)+delta)
    disp((phi/gama)*(1-cos(gama*i))+delta*(i))
    //in1(1,i*10)=i*10
end

plot(in1,in3)
