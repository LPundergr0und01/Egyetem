% -----------
% Description
% -----------
% The function calculates the values of different discrete probability density functions.
%
% -----
% Input
% -----
% \mathbf{x} = \left[x_i\right]_{i=1}^n} - an increasing sequence of positive integers
% distribution_type                      - a string that identifies the distribution (e.g., 'Bernoulli', 
%                                          'binomial', 'Poisson', 'geometric', etc.)
% parameters                             - an array of parameters which characterize the distribution 
%                                          specified by distribution_type
%
% ------
% Output
% ------
% \mathbf{f} = \left[f(x_i)\right]_{i=1}^n - values of the given probability density function
function f = DiscretePDF(x, distribution_type, parameters)

% for safety reasons
sort(x);
x = round(x);

% get the size of the input array
n = length(x);

% select the corresponding distribution
switch (distribution_type)
    
    case 'geometric'
        % the Geo(p}-distribution has a single parameter p in (0,1)
        p = parameters(1);
        
        % check the validity of the distribution parameter p
        if (p < 0 || p > 1)
            error('Wrong parameter!');
        end
        
        % allocate memory and evaluate the probability density function f_{Geo(p)} 
        % for each element of the input array \mathbf{x} = \left[x_i\right]_{i=1}^n}
        f = zeros(1, n);

        q = 1 - p;
        
        for i = 1:n
            % check the validity of the current value x_i
            if (x(i) < 1)
                error('Incorrect input data!');
            else
                f(i) = q^(x(i) - 1) * p; 
            end
        end
        
    case 'poisson'
        p = parameters(1);
        
        if p <=0 
             error('Wrong parameter!');
        end
        f = zeros(1, n);
        
        for i=1:n
            if x(i)<0
                error('Incorrect input data!');
            else
                f(i) = (p^x(1)/(factorial(x(i))))*exp(-p);
            end
        end
        
    case 'hypergeometric'
        N = parameters(1);
        M = parameters(2);
        nn = parameters(3);
        
        if N < 1
           error('Wrong parameter!'); 
        end
        
        if M < 0 || M > N
            error('Wrong parameter!');
        end
        
        if nn < 0 || nn > N
            error('Wrong parameter!');
        end
        
        f=zeros(1,n);
        
        for i=1:n
            if (x(i)<max(0,nn-N+M) || x(i)>min(nn,M))
                error('incorrect input data!');
            else
                k = x(i);
                f(i) = (comb(M,k)*comb(N-M,nn-k))/(comb(N,nn));
            end
        end
        
        
    case 'binomial'
        nn = parameters(1);
        p = parameters(2);
        if (nn < 1 || p <= 0 || p >=1)
             error('Wrong parameter!');
        end
        f=zeros(1,n);
        
        for i=1:n
            if (x(i)<0)
                error ('Incorrect input data!');
            else
                f(i) = comb(nn,x(i))*p^x(i)*(1-p)^(nn-x(i));
            end
        end
end
        
end

function c=comb(n,k)
    c = factorial(n)/(factorial(k)*factorial(n-k));
end