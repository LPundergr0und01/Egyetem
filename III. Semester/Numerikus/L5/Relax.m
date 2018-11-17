function [ X,k ] = Relax( A,b,e,o )
    L1_1(A);
    n = size(A);
    n = n(1);
    D = A - triu(A,1);
    D = D - tril(D,-1);
    L = -tril(A,-1);
    U = -triu(A,1);
    X = zeros(n,1);
    k = 1;
    P = D/o - L;
    Q = ((1-o)/o)*D + U;
    XX = P^(-1)*Q*X+P^(-1)*b;
    B = P^(-1)*Q;
    f = P^(-1)*b;
    while (norm(XX - X) >= (((1-norm(B))/norm(B))*e))
        k=k+1;
        X = XX;
        XX = B*X+f;
    end
end

