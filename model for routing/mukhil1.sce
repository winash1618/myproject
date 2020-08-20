clc
clear
function c=func(x)
    c=1+(1/(2+sin(x)))*sin(x)
endfunction
a=0
b=3.14
iam=intg(a,b,func)
disp(iam)
