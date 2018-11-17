function [ Y,Mu,E ] = Alg5( p,m1,m2,s1,s2,n )
    Mu = [m1;m2];
    E(1,1) = s1^2;
    E(1,2) = p*s1*s2;
    E(2,1) = E(1,2);
    L(1,1) = s1;
    L(1,2) = 0;
    L(2,1) = p*s2;
    L(2,2) = sqrt(1-p^2)*s2;
    T = 2*pi;
    for i=1:n
        U1 = ULEcuyerRNG();
        U2 = ULEcuyerRNG();
        R = sqrt(-2*log(U1));
        O = T*U2;
        X = [R*cos(O);R*sin(O)];
        Y(i,:) = Mu + L*X;
    end
end

