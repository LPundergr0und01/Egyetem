function [ A , B ] = Generate( n )
    A = zeros(n,n);
    A(:,:) = A(:,:) - 1;
    A = A - triu(A,2);
    A = A - tril(A,-2);
    A = A + eye(n)*6;
    B = zeros(n,1);
    B(:) = B(:) + 3;
    B(1) = B(1) + 1;
    B(n) = B(n) + 1;
end

