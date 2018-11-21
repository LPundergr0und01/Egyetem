n = 50000;
Xexp = Generate( 1 , 1/3, n );
Xnor = Generate( 2 , [0,1], n );
Xgeo = Generate( 3 , 1/3, n );mk 
Xpoison = Generate( 4 , 1/2, n );
Xgamma = NewNewton([1/2,1,],0.01, n );

VarExp = var(Xexp)% 1/lambda^2
VarNor = var(Xnor)% sigma^2    
VarGeo = var(Xgeo)%(1-p)/p^2
VarPoison = var(Xpoison) % lambda
VarGamma = var(Xgamma) % a / b

MeanExp = mean(Xexp) % 1/lambda
MeanNor = mean(Xnor)% mu
MeanGeo = mean(Xgeo)% 1/p
MeanPoison = mean(Xpoison)% lambda
MeanGamma = mean(Xgamma)% a/b^2