% -----------
% Description
% -----------
% The function performs a two-sample F-test of the null hypothesis H_0 : lambda^2 = sigma_1^2 / sigma_2^2 = 1 that the 
% data in the two independent samples X = {X_i}_{i=1}^m and Y = {Y_j}_{j=1}^n, of random variables 
% X ~ N(mu_1, sigma_1) and Y ~ N(mu_2, sigma_2), come from distributions with equal theoretical 
% standard deviations.
%
% The test is performed against the alternative hypothesis specified by the input  
% parameter tail.
%
% -----
% Input
% -----
% X = {X_i}_{i=1}^m - an independent and identically distributed sample of the normal distribu- 
%                     tion  N(mu_1, sigma_1), where sigma_1 > 0 is unknown
% N(mu_2, sigma_2)  - an independent and identically distributed sample of the normal distribu- 
%                     tion N(mu_2, sigma_2), where sigma_2 > 0 is unknown
% alpha             - represents the significance level alpha in (0,1)
% tail              - a parameter that can be set either by one of the strings 'both', 'right', 
%                     'left', or by using one of the numbers 0, 1, -1 (it determines the type of 
%                     the alternative hypothesis)
%
% ------
% Output
% ------
% ci_f       - confidence interval for the random variable F_{m,n}
%
% ci_lambda  - confidence interval for the ratio lambda = sigma_1 / sigma_2 of the theoretical standard 
%              deviations
% f_value    - value of the test, assuming that the null hypothesis H_0 : lambda^2 = 1 is true
% p_value    - probability of observing the given result, or one more extreme, by chance 
%              if the null hypothesis H_0 : lambda^2 = 1 is true (small p-values cast doubt on
%              the validity of the null hypothesis)
% H          - the code of the accepted hypothesis (0 = null hypothesis, 1 = alternative 
%              hypothesis defined by the input parameter tail)
%
function [ci_f, ci_lambda, f_value, p_value, H] = FTest2D(X, Y, alpha, tail)

m = length(X);
n = length(Y);

sigma1_2_ = var(X);
sigma2_2_ = var(Y);

f_value = sigma1_2_ / sigma2_2_;

switch (tail)
    case {'both', 0}
        ci_f(1) =  finv(alpha/2, m-1, n-1);
        ci_f(2) =  finv(1 - alpha/2, m-1, n-1);
        
        ci_lambda(1) = 1/(sqrt(ci_f(2)))*sqrt(f_value);
        ci_lambda(2) = 1/(sqrt(ci_f(1)))*sqrt(f_value);
        
        probability = fcdf(f_value, m-1, n-1);
        p_value = 2.0 * min(probability, 1 - probability);
        
    case {'right', 1}
        ci_f(1) =  0;
        ci_f(2) =  finv(1 - alpha, m-1, n-1);
        
        ci_lambda(1) = 1/(sqrt(ci_f(2)))*sqrt(f_value);
        ci_lambda(2) = Inf;
        
        probability = fcdf(f_value, m-1, n-1);
        p_value = 1 - probability;
            
    case {'left', -1}
        ci_f(1) =  finv(alpha/2, m-1, n-1);
        ci_f(2) =  Inf;
        
        ci_lambda(1) = 0;
        ci_lambda(2) = 1/(sqrt(ci_f(1)))*sqrt(f_value);
        
        probability = fcdf(f_value, m-1, n-1);
        p_value = probability;
end

H = ~(f_value > ci_f(1) && f_value < ci_f(2));

% do you have any doubt? -- if yes, then apply the corresponding significance test!
if (p_value < alpha)
    disp('Warning: small p-value cast doubt on the validity of the null-hypothesis!');
end
end













