function X  = Laplace( n )
    X = zeros(1,n);
    init = 1;
    for i=1:n
        Y = ExactInversion('exponential',1,1);
        [V] = URealRNG(init,3,-1,1,1);
        while ((Y-1)^2)>-2*log(abs(V))
            Y = ExactInversion('exponential',1,1);
            [V] = URealRNG(init,3,-1,1,1);
        end  
        X(i)= sign(V)*Y;
    end
    hist(X);
end

