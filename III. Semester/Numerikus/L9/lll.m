f = @(x)(1./(1+x.^2));
a = -5;
b = 5;
X = linspace(a,b,21);
fx = f(X);
Y = linspace(a,b,100);
C = I(X,fx);
S = zeros(1,100);
for i = 1:100
    S(i) = ll(X,Y(i),C);
end
hold on;
fx = f(Y);
plot(Y,S,'red');
plot(Y,fx,'blue');
