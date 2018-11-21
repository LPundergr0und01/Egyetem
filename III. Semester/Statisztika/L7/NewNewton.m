function X = NewNewton( par,e,n )
    X=zeros(1,n)+1;
    F=@(x)ContinuousCDF(x,'gamma',par);
    f=@(x)ContinuousPDF(x,'gamma',par);
    for i=1:n
        u = ULEcuyerRNG();%* (F(b) - F(a)) + F(a);
        x = 1;
        s = 0;
        while (x-u > e && s < 20)
            x = x - ((F(x)-u)/f(x));
            s = s + 1; 
        end
        X(i) = x;
    end
    hist(X);
end

