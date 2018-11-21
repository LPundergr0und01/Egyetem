function [ M,V] = F3( n )
    X = zeros(1,n);
    i = 1;
    ido = 0;
    while(i<n)
        u = ULEcuyerRNG();
        if (u < 1/3)
            ido = ido + 3;
            X(i)=ido;
            ido = 0;
            i = i+1;
        end
        if (u >1/3 && u <2/3)
            ido = ido + 5;
        end
        if (u > 2/3)
            ido = ido + 7;
        end 
    end
    M = mean(X);
    V = var(X);
end

