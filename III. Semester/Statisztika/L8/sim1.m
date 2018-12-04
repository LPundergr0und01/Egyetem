function N = sim1(n)
    cel = 0.95;
    
    p = 0;
    N = 1;
    mu = 1/2;
    eps = 0.05;
    X1 = [0,1;1-mu,mu];
    while (p < cel)
        hold on;
        
        k = 0;
        
        for i=1:n
            X = InversionBySequentialSearch(X1,1,N);
            
            if (abs(mean(X)-mu) < eps)
                k = k+1;
            end
        end
        
        p = k / n;
        stem(N,p);
        drawnow;

        N = N+5;
    end
end