function X = Newton( par,a,b,e,n )
X=zeros(1,n);
F=@(x)ContinuousCDF(x,'gamma',par);
f=@(x)ContinuousPDF(x,'gamma',par);
initVal = 0;
maxIter = 1000;

for i = 1 : n
    temp = initVal;
    u = ULEcuyerRNG() * (F(b) - F(a)) + F(a);
    
    while(true)
        x = temp;
        s = 0;
        
        while(abs(F(x) - u) > e && s < maxIter)
            x = x - (F(x) - u) / f(x);
            s = s + 1;
        end
        
        if s < maxIter
            break;
        %else
         %   temp = temp - 0.1;
        end
    end

    X(i) = x;
end
hist(X);
end

