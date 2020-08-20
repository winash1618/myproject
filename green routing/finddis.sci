function [sis,mes] =finddis()
    for ka=1:pop
        temp=zeros(pop,x)
        dis=zeros(pop,x)
        po=zeros(x,z)
        mo=zeros(z,z,x)
        prob=rand
        if(prob<0.8)
            kom=1+round((z-1)*rand(1,(x-1)))    
            kop=kom
        else
            kop=kom
        end
        i=1
        for k=1:x
            temp=0
            r=1
            while i<min(kom) & i<=z
                disp(min(kom))
                po(k,r)=a(i)
                r=r+1
                if i<=z
                    i=i+1
                end
            end
            for g=1:x-1
                if kom(g)==min(kom)
                    kom(g)=100
                break
                end
            end
                disp(kom)
        end
        disp(po)
        for k=1:x
            i=1
            while po(k,i+1)~=0
                mo(po(k,i),po(k,i+1),k)=1
                i=i+1
            end      
        end
        for k=1:x
            for i=1:z
                for j=1:z
                    dis(ka,k)=dis(ka,k)+tim(i,j)*mo(i,j,k)
                end
            end
        end
        for k=1:x
            for i=1:z
                if(po(k,i)~=0)
                    temp(ka,k)=temp(ka,k)+1
                end
            end
            if temp(ka,k)>0
                dis(ka,k)=dis(ka,k)+dib(k,po(k,1))+dib(k,po(k,temp))
            end
        end
        
    end
    mes=temp
    sis=dis
    mog=zeros(1,pop)
    for i=1:pop
        mog(i)=sum(sis(i,:))
    end
    plot(iter,max(mog))
endfunction
