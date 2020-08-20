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
tc = 750
b = 140
FH = 15
FT = 32
r=1
p=1
total = zeros(w,1)
demand = zeros(w,1)
qc = zeros(w,1)
demand_mat =[ 2500 4300 3750 6500 ]
for i=1 : w
    total(i,1) = exp(1500)
end
for i=1 : w
    for j =1 : n
        demand(i,1) = demand(i,1) + y(i,j)* demand_mat(1,j)
    end
    r=1
    p=1
    for q = 1 : 1500
        total_cost= r*FH +(demand(i,1)/q)*p*FT
        if ( modulo(q,tc)  == 0 )
            p = p + 1
        end
        if ( modulo(q,b)  == 0 )
            r = r + 1
        end
        if ( total(i,1) > total_cost )
            total(i,1) = total_cost
            qc(i,1) = q
        end
        
    end
end
//disp(total)
cost=zeros(n,1)
cost1=zeros(n,1)
x=eye(4,4)
for iter=0 : 100
    cost=zeros(n,1)
    cost1=zeros(n,1)
    pm=rand()
    for i = 1 : n
       temp=x(i,:)
       for j = 1 : w
          if(sum(temp)~= 0)
             if(x(i,:)==y(j,:))
                   cost(i,1)=total(j,1)
             end
          end
       end
    end
    jin=x
    for i = 1:n
        for j =1:n
            if(pm<0.1 & jin(i,j)==0)
                for k = 1 : n  
                    if(jin(k,j)==1)
                        jin(k,j)=0
                    end
                end
                jin(i,j)=1 
            end
        end
    end
    for i = 1 : n
        temp=jin(i,:)
        for j = 1 : w
            if(sum(temp)~= 0)
                if(jin(i,:)==y(j,:))
                    cost1(i,1)=total(j,1)
                end
            end
        end
    end         
    if(sum(cost1)<sum(cost))
        x=jin
    end
end
disp(sum(cost))
