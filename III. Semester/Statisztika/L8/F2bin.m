function [] = F2bin(n)
    m = 10;
    p = 1/3;
    X1 = [0,5;p,1-p];
    X = InversionBySequentialSearch(X1,1,n);
    %X = binornd(m,p,1,n);
    alpha = 0.01;
    x = norminv(1 - (alpha/2),0,1);
    A = (m^2)-(m/n)*(x^2);
    S = mean(X);
    B = (-2*m*S)-((x^2)*(m/n));
    C = S*S;
    delta = (B^2) - (4*A*C);
    p1 = (-B - sqrt(delta)) / (2*A)
    p2 = (-B + sqrt(delta)) / (2*A)
    
    if (p>p1 && p<p2)
        disp('Megfelel')
    else
        disp('Nem felel meg')
    end
    
end