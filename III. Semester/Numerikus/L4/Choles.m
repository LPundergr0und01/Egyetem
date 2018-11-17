function [ L ] = Choles( A )
   n = size(A);
   if (n(1)~=n(2))
        disp('nem negyzetes');
        return
   end
    n = n(1);
    L = zeros(n,n);
    if (~issymmetric(A))
       disp('nem szimmetrikus');
        return
    end 
    L(1,1)= sqrt(A(1,1));
    if (L(1,1) < 0)
      disp('nem pozitiv definit');
        return
    end  
    for i=2 : n
        for j=1:i-1
            l1 = L(i,1:j-1);
            l2 = L(j,1:j-1);
            ll = l1.*l2;
            L(i,j) = A(i,j) - sum(ll);
            L(i,j) = L(i,j)/L(j,j);
        end
        t = A(i,i) - sum(L(i,1:i-1).^2);
        if (t < 0)
            disp('nem pozitiv definit');
            return
        end
        L(i,i) = sqrt(t);
    end
end

