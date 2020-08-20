function f=func(b)
    f=42*b-cos(6*b)-43
endfunction
hi=zeros(1,201)
hi1=zeros(1,201)
for i=-100:100
    hi(1,i+101)=i
    hi1(1,i+101)=func(i)
end
plot(hi,hi1)
