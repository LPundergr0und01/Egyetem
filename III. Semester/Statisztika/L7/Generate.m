function X = Generate( d_t , par, n )
  X = zeros(1,n);
  
  switch (d_t)
      case 1 %exponencialis
          
          
        if (par<=0)
            error('Lambda > 0');
        end
        F_inv = @(x)((-log(x))/(par));
        for i=1:n
            U = ULEcuyerRNG;
            X(i) = F_inv(U);
        end
        
        
      case 2 %normal
          
          
        if (size(par) ~= 2)
            error('Wrong parameters');
        end
        if (par(2)<=0)
            error('sigma > 0');
        end
        mu = par(1);
        sigma = par(2);
        i=1;
        while (i<=n) 
            U1 = ULEcuyerRNG;
            U2 = ULEcuyerRNG;
            R = sqrt(-2*log(U1));
            FI = 2*pi*U2;
            X(i) = R*cos(FI);
            X(i) = X(i)*sigma + mu;
        if (i+1<=n)
            X(i+1) = R*sin(FI);
            X(i+1) = X(i+1)*sigma + mu;
            i = i+1;
        end        
            i = i+1;
        end
        
        
      case 3 %geometriai
          
        if (par<=0 || par>=1)
            error('0 < p < 1)');
        end
        for k=1:n
            U = ULEcuyerRNG;
            X(k) = (log(U))/(log(1-par));
        end
        
        
      case 4 %Poisson
       
        if (par<=0)
            error('Lambda > 0');
        end
        lambda = par;
        for k=1:n
            U = ULEcuyerRNG;
            i = 0;
            p = exp(-lambda);
            S = p;
        
            while U>S
                i = i+1;
                p = p*(lambda/i);
                S = S+p;
            end
            X(k) = i;
        end
          
      case 5    %Gamma
        

        if (size(par) ~= 2)
            error('Wrong parameters');
        end
        a = par(1);
        b = par(2);
        if (a<=0 || b<=0)
            error('a > 0, b > 0')
        end
        
        for i=1:n
            u = ULEcuyerRNG;
            X(i) = (1/((b^a)*gamma(a)))*u^(a-1)*exp(-u/b);
        end
        
          
  end   
end

