function [X,U] = ExactInversion( d_t,par,n )
%#1 feladat
X=zeros(1,n);

U=ULEcuyerRNG(1,n);

if(par(1)<=0)
    error('Wrong parameter!');
end
    
switch(d_t)
    case {'exponential'}
        X=(-1/par)*log(1-U);
    case {'Cauchy'}
        X=par*tan(pi*U);
     case {'Rayleigh'}
        X=par*sqrt(-2*log(U));
     case {'haromszogu'}
        X=par*(1-sqrt(U));
     case {'Rayleigh-fele veg'}
        X=sqrt(par^2-2*log(U));
     case {'Pareto-fele'}
         if(par(2)<=0)
             error('Wrong parameter!');
          end
        X=par(2)./(U.^(1/par(1)));
    case {'mas'}
        if(par(2)<=0)
             error('Wrong parameter!');
        end
        X = par(1) * nthroot(-log(1 - U), par(2));
        
end
hist(X);
end

