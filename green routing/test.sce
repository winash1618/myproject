
    tc = 750
    b = 140
    FH = 15
    FT = 32
    r=1
    p=1
    demand = 2500
    temp = exp(1500)
    temp1 = 0
    for q = 1 : 1500
        total_cost= r*FH +(demand/q)*p*FT
        if ( modulo(q,tc)  == 0 )
            p = p + 1
        end
        if ( modulo(q,b)  == 0 )
            r = r + 1
        end
        if ( temp > total_cost )
            temp = total_cost
            temp1 = q
        end
        
    end
    disp(temp)
