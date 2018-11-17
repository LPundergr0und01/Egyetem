function [ L,U,P ] = LUPfel( A )
    n = size(A);
    if (n(1)~=n(2))
        disp('nem negyzetes');
    end
    n = n(1);
    P = eye(n);
    for j= 1 : n-1
        aa = abs(A(j:n,j));
        [m,ii] = max(aa);
        if (m == 0)
            disp('Nem megoldhato');return;
        end
        ii = ii + j -1;
        A([j,ii],:) = A([ii,j],:);
        P([j,ii],:) = P([ii,j],:);
        for i = j+1:n
            l = A(i,j)/A(j,j);
            A(i,j:n) = A(i,j:n) - A(j,j:n)*l;
            A(i,j)= l;
        end
    end
    U = triu(A);
    L = tril(A,-1);
    L = L + eye(n);
end

