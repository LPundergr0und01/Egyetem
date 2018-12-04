function sx = ll( X,x,C )
    
    n = length(X);
    t = find(x>=X);
    nn = length(t);
    if (nn == n)
        k = n-1;
    else
        k = nn;
    end
    sx = C(1,k)+C(2,k).*(x-X(k))+C(3,k).*(x-X(k)).*(x-X(k))+C(4,k).*(x-X(k)).*(x-X(k)).*(x-X(k));
end

