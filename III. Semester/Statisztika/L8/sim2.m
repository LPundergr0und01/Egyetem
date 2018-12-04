function N = sim2(n)
    cel = 0.9;
    p = 0;
    N = 1;
    mu = 2800;
    sigma = 708;
    epsilon = 224;
    
    while (p<cel)
        hold on;
        
        k = 0;
        
        for i=1:n
            X = normrnd(mu,sigma,1,N);
            
            if (abs(mean(X)-mu) < epsilon)
                k = k+1;
            end
        end
        
        p = k / n;
        stem(N,p);
        drawnow;
        
        N = N+1;
    end
end