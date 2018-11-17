function [ V ] = matrixGenerator( T )
    n = size(T);
    n = n(2);
    V = zeros(n,n);
    V(:,1)=1;
    for i = 1 : n
        for j =2 : n
            V(i,j) = V(i,j-1) .* T(i); 
        end
    end
end

