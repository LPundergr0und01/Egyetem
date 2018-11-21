% -----------
% Description
% -----------
% The function evaluates different continuous probability density functions.
%
% -----
% Input
% -----
% \mathbf{x} = \left[x_i\right]_{i=1}^n - an increasing sequence of real numbers
% distribution_type                     - a string that identifies the distribution (e.g., 'exponential', 
%                                         'normal', 'chi2', 'gamma', 'beta', 'Student', etc.)
% parameters                            - an array of parameters which characterize the distribution 
%                                         specified by distribution_type
%
% ------
% Output
% ------
% \mathbf{f} = \left[f_i\right]_{i=1}^n  = \left[f(x_i)\right]_{i=1}^n} - values of the given probability density function
%
function f = ContinuousPDF(x, distribution_type, parameters)

% for safety reasons
x = sort(x);

% get the size of the input array
n = length(x);
% select the corresponding distribution
switch (distribution_type)
    
    case 'normal'
        % the N(mu,sigma)-distribution has two parameters, where mu in \mathbb{R} and sigma > 0
        mu    = parameters(1);
        sigma = parameters(2);
        
        % check the validity of the distribution parameters 
        if (sigma <= 0)
            error('The standard deviation must be a strictly positive number!');
        end

        % Allocate memory and evaluate the probability density function f_{N(mu,sigma) 
        % for each element of the input array \mathbf{x} = \left[x_i\right]_{i=1}^n.
        %
        % Note that, in this special case, this can be done in a single line of code,
        % provided that one uses the dotted arithmetical operators of MATLAB.
        
        f = (1.0 / sqrt(2.0 * pi) / sigma) * exp(-(x - mu).^ 2 / 2.0 / sigma^2); 
        
    case 'exponential'
        p = parameters(1);
        
        if(p <= 0)
            error('Parameter error!');
        end
        f = (p.*exp(-p.*x).*( x>=0));
        
    case 'gamma'
        a = parameters(1);
        b = parameters(2);
        if (a<=0) 
            error('Parameter error!');
        end       
        if (b<=0) 
            error('Parameter error!');
        end
        f = ((1/(b.^a.*gamma(a)).*x.^(a-1).*exp(-x/b)).*(x>=0));
    
    case 'beta'
        a = parameters(1);
        b = parameters(2);
        
        if (a<=0) 
            error('Parameter error!');
        end
        
        if (b<=0) 
            error('Parameter error!');
        end
        
        f = (1/beta(a,b).*x.^(a-1).*(1-x).^(b-1)).*(0<x).*(x<=1);
        
        case 'x2'
        a=parameters(1)/2;
        b=2*(parameters(2)^2);
        
        if (a<=0) 
            error('Parameter error!');
        end
        
        if (b<=0) 
            error('Parameter error!');
        end
        
        f = ((1/(b.^a.*gamma(a)).*x.^(a-1).*exp(-x/b)).*(x>=0));
    case 'mas'
        a=parameters(1);
        b=parameters(2);
        
         if (a <= 0 || b<=0)
            error('The standard deviation must be a strictly positive number!');
         end
         
         n=length(x);
        f=zeros(1,n);
        
        for i=1:n
            if(x(i)>0)
                f(i)=exp(-(x(i)/a)^b)*(b*x(i)^(b-1))/(a^b);
            end
        end
    
end