% -----------
% Description
% -----------
% The function evaluates the values of different continuous cumulative distribution 
% functions.
%
% -----
% Input
% -----
% \mathbf{x} = \left[x_i\right]_{i=1}^n - an increasing sequence of real numbers
%
% distribution_type                     - a string that identifies the distribution (e.g., 'exponential', 
%                                         'normal', 'chi2', 'gamma', 'beta', 'Student', etc.)
%
% parameters                            - an array of parameters which characterize the distribution 
%                                         specified by distribution_type
%
% ------
% Output
% ------
% \mathbf{F} = \left[F_i\right]_{i=1}^n = \left[F(x_i)\right]_{i=1}^n - values of the given cumulative distribution function
%
% ----
% Hint
% ----
% Since the input sequence \mathbf{x} = \left[x_i\right]_{i=1}^n \subset \mathbb{R} is increasing it is sufficient to calculate 
% the values
%
% F_1 = \int_{x_{\min}}^{x_1}  f(t) dt,
% F_2 = F_1 + \int_{x_1}^{x_2} f(t) dt, 
% ...,
% F_n = F_{n-1} + \int_{x_{n-1}}^{x_n} f(t) dt,
%
% where f denotes the probability density function that corresponds to F and x_{min}
% represents the minimal value of the random variable (e.g., in case of the gamma  
% distribution x_{min} = 0, while in the case of the normal distribution x_{min} = -inf).
%
function F = ContinuousCDF(x, distribution_type, parameters)


% for safety reasons
%x = sort(x);

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
        
        f = @(t)(1.0 / sqrt(2.0 * pi) / sigma) * exp(-(t - mu).^ 2 / 2.0 / sigma^2); 
        min=-Inf;
        F=zeros(1,n);
        
        for i=1:n
            F(i)=integral(f,min,x(i));
            min=x(i);
            if(i>1)
                F(i)=F(i)+F(i-1);
            end
        end
        
    case 'expon'
        lambda=parameters(1);
        
         if (lambda <= 0)
            error('The standard deviation must be a strictly positive number!');
         end
         
        n=length(x);
        
        f =@(t)(lambda * exp(-lambda*t)); 

        min=0.000000001;
        F=zeros(1,n);
        
        for i=1:n
            if(x(i)>0)
                F(i)=integral(f,min,x(i));
                min=x(i);
                if(i>1)
                    F(i)=F(i)+F(i-1);
                end
            end
        end
        
          
      case 'gamma'
        a=parameters(1);
        b=parameters(2);
         if (a <= 0 || b<=0)
            error('The standard deviation must be a strictly positive number!');
         end 
        n=length(x);
        f = @(t)((t.^(a-1)).* exp(-(t/b))/((b.^a)*gamma(a)));
        min=0.000000001;
        F=zeros(1,n);
        for i=1:n
            if(x(i)>0)
                F(i)=integral(f,min,x(i));
                min=x(i);
                if(i>1)
                    F(i)=F(i)+F(i-1);
                end
            end
        end
        
         case 'student'
        nn=parameters(1);
        
         if (nn < 1)
            error('The standard deviation must be a strictly positive number!');
         end
         
        n=length(x);
        
        f=@(t)(gamma((n+1)/2)*((1+(t.^2)/n).^((-n-1)/2)))/(sqrt(n*pi)*gamma(n/2));

        min=0.000000001;
        F=zeros(1,n);
        
        for i=1:n

            F(i)=integral(f,min,x(i));
            min=x(i);
            if(i>1)
                F(i)=F(i)+F(i-1);
            end
            
        end
        
        case 'plusz'
        lambda = parameters(1);
        alpha=1+2*lambda+lambda^2;
        
        n=length(x);
        
        f =@(t) (alpha.*t.*exp((-1-lambda).*t)); 

        min=0;
        F=zeros(1,n);
        
        for i=1:n
            if(x(i)>0)
                F(i)=integral(f,min,x(i));
                min=x(i);
                if(i>1)
                    F(i)=F(i)+F(i-1);
                end
            end
        end 
        
         case 'pearson'
        nn=parameters(1);
        sigma=parameters(2);
        
         a=nn/2;
        b=2*sigma^2;
        
         if (a <= 0 || b<=0)
            error('The standard deviation must be a strictly positive number!');
         end
         
         n=length(x);
      
         f = @(t)((t.^(a-1)).* exp(-(t/b))/((b.^a)*gamma(a)));
         
         
        min=0.000000001;
        F=zeros(1,n);
        
        for i=1:n
            if(x(i)>0)
                F(i)=integral(f,min,x(i));
                min=x(i);
                if(i>1)
                    F(i)=F(i)+F(i-1);
                end
            end
        end
        
          case 'mas'
        a=parameters(1);
        b=parameters(2);
        
         if (a <= 0 || b<=0)
            error('The standard deviation must be a strictly positive number!');
         end
         
         n=length(x);
        F=zeros(1,n);
        
        for i=1:n
            if(x(i)>0)
                F(i)=1-exp(-((x(i)/a)^b));
            end
        end    
        
        case 'x2'
        a=parameters(1)/2;
        b=2*(parameters(2)^2);
        
         if (a <= 0 || b<=0)
            error('The standard deviation must be a strictly positive number!');
         end
         
         n=length(x);
      
         f = @(t)((t.^(a-1)).* exp(-(t/b))/((b.^a)*gamma(a)));
         
         
        min=0.000000001;
        F=zeros(1,n);
        
        for i=1:n
            if(x(i)>0)
                F(i)=integral(f,min,x(i));
                min=x(i);
                if(i>1)
                    F(i)=F(i)+F(i-1);
                end
            end
        end
end
