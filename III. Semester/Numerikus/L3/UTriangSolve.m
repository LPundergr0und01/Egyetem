function x = UTriangSolve( U , c )
    n = size(U);
    n = n(1);
    x = zeros(1,n);
    x(n) = c(n)/U(n,n);
    sum = x(n);
    for i=n-1:-1:1
        x(i)= (1/U(i,i))*(c(i)-sum);
        sum = sum + x(i);
    end
end

