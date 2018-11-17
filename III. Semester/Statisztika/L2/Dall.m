figure;
%Geometric a'la MATLAB:

range = [1,10];
x = range(1):range(2);

p = 1/3;

f = geopdf(x,p);
F = geocdf(x,p);

subplot(4,2,1);
scatter(x,f);
title('Matlabs geometric');
hold on;
grid on;
grid minor;
stairs(x,F);
hold off;

%My geometric:

f = DiscretePDF(x,'geometric',p);
F = DiscreteCDF(x,'geometric',p);

subplot(4,2,2);
scatter(x,f);
title('My geometric');
hold on;
grid on;
grid minor;

stairs(x,F);
hold off;

%----------------------------------------------
%Binomial a'la MATLAB:

range = [0,8];
x = range(1):range(2);
n = 8;
p = 3/10;


f = binopdf(x,n,p);
F = binocdf(x,n,p);

subplot(4,2,3);
scatter(x,f);
title('Matlabs Binomial');
hold on;
grid on;
grid minor;

stairs(x,F);
hold off;

%My binomial:

f = DiscretePDF(x,'binomial',[n,p]);
F = DiscreteCDF(x,'binomial',[n,p]);

subplot(4,2,4);
scatter(x,f);
title('My Binomial');
hold on;
grid on;
grid minor;

stairs(x,F);
hold off;

%---------------------------------------------
%Poisson a'la MATLAB:

range = [0,8];
x = range(1):range(2);
sigma = 5;


f = poisspdf(x,sigma);
F = poisscdf(x,sigma);


subplot(4,2,5);
scatter(x,f);
title('Matlabs Poisson');
hold on;
grid on;
grid minor;

stairs(x,F);
hold off;

%My Poisson:

f = DiscretePDF(x,'poisson',sigma);
F = DiscreteCDF(x,'poisson',sigma);


subplot(4,2,6);
scatter(x,f);
title('Matlabs Poisson');
hold on;
grid on;
grid minor;

stairs(x,F);
hold off;

%---------------------------------------------
%Hypergeometric a'la MATLAB:

range = [7,13];
x = range(1):range(2);
N = 20;
M = 14;
n_p = 13;


f = hygepdf(x,N,M,n_p);
F = hygecdf(x,N,M,n_p);


subplot(4,2,7);
scatter(x,f);
title('Matlabs hypergeometric');
hold on;
grid on;
grid minor;

stairs(x,F);
hold off;

%My hypergeometric:

f = DiscretePDF(x,'hypergeometric',[N,M,n_p]);
F = DiscreteCDF(x,'hypergeometric',[N,M,n_p]);


subplot(4,2,8);
scatter(x,f);
title('My hypergeometric');
hold on;
grid on;
grid minor;

stairs(x,F);
%scatter(x,F);
hold off;