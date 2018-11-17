function [X,t] = koz( n )
    X = zeros(1,n);
    a = exp(-(1/2));
    b = 1/2;
    c = 2^(1/2);
    t = 0;
    for i=1:n
        U = ULEcuyerRNG();
        v = ULEcuyerRNG();
        Y = tan(pi*v);
        S = b*(Y^2);
        W = (a*U)/(b+S);
        if (abs(Y) > c)
            L = false;
        else
            if (W <= 1 - S)
                L = true;
            else 
                L = false;
            end
        end
        if (~L)
            t = t + 1;
            if (W <= exp(-S))
                L = true;
            else
                L = false;
            end
        end
        while(~L)
            U = ULEcuyerRNG();
            v = ULEcuyerRNG();
            Y = tan(pi*v);
            S = b*(Y^2);
            W = (a*U)/(b+S);
            if (abs(Y) > c)
                L = false;
            else
                if (W <= 1 - S)
                    L = true;
                else 
                    L = false;
                end
            end
            if (~L)
                t = t + 1;
                if (W <= exp(-S))
                    L = true;
                else
                    L = false;
                end
            end 
        end
        X(i) = Y;
    end
    hist(X);
    t = t/n;
end
    



