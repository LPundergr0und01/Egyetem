function q = Aitken( X,fX,x,e )
    n = size(X);
    n = n(2);
    Q = zeros(n,n);
    dis = abs(X-x);
    [B,I] = sort(dis);
    X = X(I);
    fX = fX(I);
    Q(1,:) = fX;
    Q = Q';
    i = 2;
    while ((i <= n) && (abs(Q(i,i)-Q(i-1,i-1)) > e))
        for j=1:i-1
          Q(i,j+1) = (Q(j,j)*(X(i)-x) - Q(i,j)*(X(j) - x))/(X(i)-X(j));
        end
       i = i + 1;
    end
    i = i - 1;
    if (abs(Q(i,i)-Q(i-1,i-1)) > e)
       disp('nem tudta kozeliteni');
    end
    q = Q(n,n);
end

