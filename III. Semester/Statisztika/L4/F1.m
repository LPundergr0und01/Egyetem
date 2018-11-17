function X = F1( n)
    X = zeros(1,n);
    a=0;
    b=1;
    f = @(x) 168*x^5*(1-x)^2;
    for i=1:n
        u = ULEcuyerRNG();
        v = ULEcuyerRNG();
        Y = a + (b - a)*v;
        while (u*2.55>f(Y))
            u = ULEcuyerRNG();
            v = ULEcuyerRNG();
            Y = a + (b - a)*v;
        end
        X(i) = Y;
    end
    hist(X);
end

