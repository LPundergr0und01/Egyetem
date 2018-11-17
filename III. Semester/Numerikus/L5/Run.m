[A,b] = Generate(6);
[Xj ,kj, Bj] = Jak(A,b,eps);
Xj
kj
[Xg ,kg] = Gaus(A,b,eps)
t = max(abs(eig(Bj)));
o = 2/(1+sqrt(1-t^2));
[Xr,kr] = Relax(A,b,eps,o)