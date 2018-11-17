n = 10000;
[X1, X2] = Marsaglia(n);

X1 = X1';
X2 = X2';

subplot(2,2,1)
plot(X1,X2,'b.');
subplot(2,2,2)
hist3([X1, X2]);

[Y,mu ,epsilon] = Alg5(0.45,2,1,3,1,n);

subplot(2,2,3)
hold on;
scatter(Y(:,1),Y(:,2),'m.');
subplot(2,2,4)
%Y = Y';
hist3(Y);