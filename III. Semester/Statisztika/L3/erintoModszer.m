function X = erintoModszer(d_t, parameters, a, b, eps, n)

X = zeros(1, n);
F = @(x) ContinuousCDF(x, d_t, parameters);
f = @(x) ContinuousPDF(x, d_t, parameters);

initVal = 3;
maxIter = 10;

for i = 1 : n
    aux = initVal;
    u = ULEcuyerRNG() * (F(b) - F(a)) + F(a);
    
    while(true)
        x = aux;
        kontor = 0;
        
        while(abs(F(x) - u) > eps && kontor < maxIter)
            x = x - (F(x) - u) / f(x);
            kontor = kontor + 1;
        end
        
        if kontor < maxIter
            break;
        else
            aux = aux - 0.1;
        end
    end

    X(i) = x;
end
end