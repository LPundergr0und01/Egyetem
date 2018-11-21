function X = Gamma2( a,b,n )
        if (a<=0 || b<=0)
            error('a > 0, b > 0')
        end
    X = zeros(n,1);
    for i=1:n
        u = ULEcuyerRNG;
        X(i) = (1/((b^a)*gamma(a)))*u^(a-1)*exp(-u/b);
        X(i)=X(i)*10;
    end
end

