div_point_count = 100;
figure;
%Normal a'la MATLAB:

range = [-4.0,8.0];
x = linspace(range(1), range(2), div_point_count);

mu_1 = -1;
sigma_1 = 1/2;

mu_2 = 0;
sigma_2 = 1;

mu_3 = 3;
sigma_3 = 3/2;


F = normpdf(x,mu_1,sigma_1);

figure;
subplot(4,2,1);
plot(x,F);
title('Matlabs normal');
hold on;
grid on;
grid minor;

F = normpdf(x,mu_2,sigma_2);
plot(x,F);
F = normpdf(x,mu_3,sigma_3);
plot(x,F);
hold off;

%My normal:

F = ContinuousPDF(x,'normal',[mu_1,sigma_1]);

subplot(4,2,2);
plot(x,F);
title('My normal');
ylim([0,1]);
hold on;
grid on;
grid minor;

F = ContinuousPDF(x,'normal',[mu_2,sigma_2]);
plot(x,F);
F = ContinuousPDF(x,'normal',[mu_3,sigma_3]);
plot(x,F);
hold off;

%----------------------------------------------
%Exponencialis a'la MATLAB:

range = [0,10];
x = linspace(range(1), range(2), div_point_count);

lambda_1 = 1/2;
lambda_2 = 1;
lambda_3 = 2;

F = exppdf(x,1/lambda_1);

subplot(4,2,3);
plot(x,F);
title('Matlabs Exponential');
hold on;
grid on;
grid minor;

F = exppdf(x,1/lambda_2);
plot(x,F);
F = exppdf(x,1/lambda_3);
plot(x,F);
hold off;

%My exponential:

F = ContinuousPDF(x,'exponential',lambda_1);

subplot(4,2,4);
plot(x,F);
title('My Exponential');
hold on;
grid on;
grid minor;

F = ContinuousPDF(x,'exponential',lambda_2);
plot(x,F);
F = ContinuousPDF(x,'exponential',lambda_3);
plot(x,F);
hold off;

%---------------------------------------------
%Gamma a'la MATLAB:

range = [0,4];
x = linspace(range(1), range(2), div_point_count);

a_1 = 1;
a_2 = 1/2;
a_3 = 1/4;
a_4 = 3/4;
a_5 = 5/4;
a_6 = 3/2;
a_7 = 7/4;

F = gampdf(x,a_1,1);

subplot(4,2,5);
plot(x,F);
title('Matlabs Gamma');
hold on;
grid on;
grid minor;

F = gampdf(x,a_2,1);
plot(x,F);
F = gampdf(x,a_3,1);
plot(x,F);
F = gampdf(x,a_4,1);
plot(x,F);
F = gampdf(x,a_5,1);
plot(x,F);
F = gampdf(x,a_6,1);
plot(x,F);
F = gampdf(x,a_7,1);
plot(x,F);
hold off;

%My gamma:

F = ContinuousPDF(x,'gamma',[a_1,1]);

subplot(4,2,6);
plot(x,F);
title('My Gamma');
hold on;
grid on;
grid minor;

F = ContinuousPDF(x,'gamma',[a_2,1]);
plot(x,F);
F = ContinuousPDF(x,'gamma',[a_3,1]);
plot(x,F);
F = ContinuousPDF(x,'gamma',[a_4,1]);
plot(x,F);
F = ContinuousPDF(x,'gamma',[a_5,1]);
plot(x,F);
F = ContinuousPDF(x,'gamma',[a_6,1]);
plot(x,F);
F = ContinuousPDF(x,'gamma',[a_7,1]);
plot(x,F);
hold off;

%---------------------------------------------
%Beta a'la MATLAB:

range = [0,1];
x = linspace(range(1), range(2), div_point_count);

a_1 = 2;
a_2 = 1;
a_3 = 2;
a_4 = 1/2;
a_5 = 5;

b_1 = 5;
b_2 = 3;
b_3 = 2;
b_4 = 1/2;
b_5 = 1;


F = betapdf(x,a_1,b_1);

subplot(4,2,7);
plot(x,F);
title('Matlabs Beta');
hold on;
grid on;
grid minor;

F = betapdf(x,a_2,b_2);
plot(x,F);
F = betapdf(x,a_3,b_3);
plot(x,F);
F = betapdf(x,a_4,b_4);
plot(x,F);
F = betapdf(x,a_5,b_5);
plot(x,F);
hold off;

%My beta:

F = ContinuousPDF(x,'beta',[a_1,b_1]);

subplot(4,2,8);
plot(x,F);
ylim([0,6]);
title('My Beta');
hold on;
grid on;
grid minor;

F = ContinuousPDF(x,'beta',[a_2,b_2]);
plot(x,F);
F = ContinuousPDF(x,'beta',[a_3,b_3]);
plot(x,F);
F = ContinuousPDF(x,'beta',[a_4,b_4]);
plot(x,F);
F = ContinuousPDF(x,'beta',[a_5,b_5]);
plot(x,F);
hold off;
