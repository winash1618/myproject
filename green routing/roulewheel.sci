function [gog] =roulewheel()
    for i=1:pop
        tdis(i)=sum(dis(i,:)
    end
    for i=1:pop
        pdis(i)=tdis(i)/(sum(tdis)
    end
    for i=1:pop
        cdis(i)=cdis(i)+pdis(i)
    end
    for i=1:pop
        jin=rand
        for j=1:pop
            if j==1 & jin<cdis(j)
                a(i,:)=a(j,:)
            else
                if cdis(j-1)<jin<cdis(j)
                    a(i,:)=a(j,:)
                end
            end
        end
    end
    gog=a
endfunction
