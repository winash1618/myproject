clc
clear
function [phi,gama,delta,xij,w]=getter()
    phi=10
    gama=45
    delta=100
    xij=1
    w=100
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
function d=dij()
    phi=10
    gama=45
    delta=100
    function f=jk(x)
        f=phi*sin(gama*x)+delta
    endfunction
    d=intg(0,10,jk)
endfunction
a=0
b=6.28
iam=intg(a,b,z1)
iam2=dij()
disp(iam)
disp(iam2)
