function [] = F2par(n)
    a = 3;
    b = 5;
    X = Par([a,b],n);
    alpha = 0.01;
    x = norminv(1-(alpha/2),0,1);
    A = ((a^2)/((a-1)^2)) - ((a*x) / ( (a-1)^2 * (a-2) * n ) );
    S = mean(X);
    B = S * ( (-2*a) / (a-1) );
    C = S*S;
    
    delta = (B^2) - (4*A*C);
    b1 = (-B - sqrt(delta)) / (2*A)
    b2 = (-B + sqrt(delta)) / (2*A)
    if (b>b1 && b<b2)
        disp('Megfelel')
    else
        disp('Nem felel meg')
    end
end