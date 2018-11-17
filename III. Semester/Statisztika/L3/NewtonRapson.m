function [X,U] = NewtonRapson( parameters,eps,n )
%#3Feladat
X=zeros(1,n);
U=zeros(1,n);
a=parameters(1)/2; 
b=2*(parameters(2)^2);

F=@(x)ContinuousCDF(x,'gamma',[a,b]);
f=@(x)ContinuousPDF(x,'gamma',[a,b]);

for i=1:n
    u=ULEcuyerRNG();
    U(i)=u;
     x=u;
     s=0;
    while(abs(F(x)-u)>eps)
        s=s+1;
        if(s>10)
            i=i-1;
            break;
        end
       
     x=x-(F(x)-u)/f(x);
    end
    X(i)=x;
    
end
hist(X)
end

