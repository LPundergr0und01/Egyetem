function  [U,c]=GaussElim(A,b)
    n = size(A);
    n = n(1);
    for j= 1 : n-1
        aa = abs(A(j:n,j));
        [m,ii] = max(aa);
        if (m == 0)
            disp('Nem megoldhato');return;
        end
        ii = ii + j -1;
        A([j,ii],:) = A([ii,j],:);
        b([j,ii]) = b([ii,j]);
        for i = j+1:n
            l = A(i,j)/A(j,j);
           % A(j) = A(j,:)*l;
            A(i,:) = A(i,:) - A(j,:)*l;
            b(i) = b(i) - b(j)*l;
        end
    end
    U = A;
    c = b;
end

