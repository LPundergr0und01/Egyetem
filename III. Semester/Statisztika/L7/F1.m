n = 5000;
Xexp = Generate( 1 , 5, n );
Xnor = Generate( 2 , [4,3], n );
Xgeo = Generate( 3 , 1/3, n );
Xpoison = Generate( 4 , 3, n );
Xgamma = NewNewton([3,2],0.01, n );

MeanExp = mean(Xexp) % 1/lambda
MeanNor = mean(Xnor)% mu
MeanGeo = mean(Xgeo)% 1/p
MeanPoison = mean(Xpoison)% lambda
MeanGamma = mean(Xgamma)% a/b^2

VarExp = var(Xexp)% 1/lambda^2
VarNor = var(Xnor)% sigma^2    
VarGeo = var(Xgeo)%(1-p)/p^2
VarPoison = var(Xpoison) % lambda
VarGamma = var(Xgamma) % a / b
