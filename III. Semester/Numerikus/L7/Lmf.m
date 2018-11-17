function lmf = Lmf( X,fx,x )
    n = size(X);
    n = n(2);
    T = zeros(n,n);
    T(:,1) = fx;
    for j=2:n
        for i=1:n-j+1
           T(i,j) = T(i+1,j-1)-T(i,j-1);
           T(i,j) = T(i,j)/(X(i+j-1)-X(i));
        end
    end
    v = T(1,:);
    lmf = v(n);
    for i=n:-1:2
        lmf = lmf.*(x-X(i-1)) + v(i-1);
    end
end

