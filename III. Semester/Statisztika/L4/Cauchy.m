function X = Cauchy( n )
    a = exp(1/2)/2;
    X = zeros(1,n);
    for i=1:n
            U = ULEcuyerRNG();
            V = ULEcuyerRNG();
            Y = tan(pi*V);
            S = Y^2;
            while(U>a*(1+S)*exp(-(S/2)))
                U = ULEcuyerRNG();
                V = ULEcuyerRNG();
                Y = tan(pi*V);
                S = Y^2;
            end
            X(i) = Y;
    end
    hist(X);
end

