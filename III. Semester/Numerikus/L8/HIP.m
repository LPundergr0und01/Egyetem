function  HIP2 = HIP( X,fX,fdX,x )
    n = size(X);
    n = n(1);
    Z = zeros(2*n,2*n);
    Z(:,1) = repelem(X,2);
    Z(:,2) = repelem(fX,2);
    Z(2:2:2*n,3) = fdX;
    for i = 3:2:2*n
        Z(i,3) = (Z(i,2)-Z(i-1,2))/(Z(i,1)-Z(i-1,1));
    end
    
    for i=4:2*n
        for j = i-1:2*n
            Z(j,i) = (Z(j,i-1)-Z(j-1,i-1))/(Z(j,1)-Z(j-i+2,1));
        end
    end
    HIP2 = Z(1,2);
    t=x-Z(1,1);
    for i=2:2*n-1 
        HIP2 = HIP2 + Z(i,i+1).*t;
        t=t.*(x-Z(i,1));
    end
end

