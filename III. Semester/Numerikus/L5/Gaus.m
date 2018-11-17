function [ X,k ] = Gaus( A,b,e )
    L1_1(A);
    n = size(A);
    n = n(1);
    D = A - triu(A,1);
    D = D - tril(D,-1);
    L = -tril(A,-1);
    U = -triu(A,1);
    X = zeros(n,1);
    k = 1;
    f = (D-L)^(-1)*b;
    B = (D-L)^(-1)*U;
    XX = B*X +f;
    while (norm(XX - X) >= (((1-norm(B))/norm(B))*e))
        k=k+1;
        X = XX;
        XX = B*X+f;
    end
end

