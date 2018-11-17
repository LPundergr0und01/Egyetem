function [X,U] = BisectionMethod( d_t,par,eps,a,b,n )
%felezo
X=zeros(1,n);
U=zeros(1,n);

F=@(x)ContinuousCDF(x,d_t,par);

for i=1:n
    u=ULEcuyerRNG()*(F(b)-F(a))+F(a);
    U(i)=u;
     A=a;
     B=b;
     x=(A+B)/2;
    while(abs(F(x)-u)>eps)
        if(u<F(x))
            B=x;
        else
            A=x;
        end
        x=(A+B)/2;
    end
    X(i)=x;    
end
hist(X);



end

