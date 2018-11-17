function x = Poisson( lambda,r )
%#4.Feladat
x=zeros(1,r);

for k=1:r
   U= ULEcuyerRNG();
   i=0;
   p=exp(-lambda);
   S=p;
   while(U>S)
       i=i+1;
       p=lambda*p/i;
       S=S+p;
   end
   x(k)=i;
    
end
hist(x)
end

