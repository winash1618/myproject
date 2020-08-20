clc
clear
function [phi,gama,delta,xij,w]=getter()
    phi=2.2
    gama=0.278
    delta=4.4
    xij=1
    w=0
endfunction
function c=z1(x)
    alpha=30
    betaa=100
    theta=1
    omega=-5
    l=250
    p=1
    [phi,gama,delta,xij,w]=getter()
    c=(alpha+(betaa/(((phi*sin(gama*x)+delta)^theta)+omega)))*(alpha*sin(gama*x)+delta)*(1+p*(w/l))*xij
endfunction
function d=dij(x)
    phi=10
    gama=45
    delta=100
    d=phi*sin(gama*x)+delta
endfunction
a=0
b=4.02
iam=intg(a,b,z1)
iam2=intg(a,b,dij)
disp(iam)
disp(iam2)
