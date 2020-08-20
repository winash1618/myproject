function [n] = mutate()
    for i=1:pop
        mpro=rand
        if mpro<o.1
            mut1=1+round((z-1)*rand(1,1))
            mut2=1+round((z-1)*rand(1,1))
            temp=a(i,mut1)
            a(i,mut1)=a(i,mut2)
            a(i,mut2)=temp
        end
    end
    n=a
endfunction
