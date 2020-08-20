z='1111'
n=4
w=bin2dec(z)
y=zeros(w,n)
for i = 1 : w
    j=n
    d=dec2bin(i)
    k=strtod(d)
    while k > 1
        c = modulo (k,10)
        k = int (k/10)
        y(i,j) = c
        j=j-1
    end
    if( k == 1 )
        y(i,j) = 1
    end
end
disp (y)
