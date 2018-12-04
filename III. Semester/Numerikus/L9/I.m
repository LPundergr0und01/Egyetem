function [ C ] = I( X,Y )
    n = size(X);
    n = n(2);
    h = zeros(1,n);
    mu = zeros(1,n);
    l = zeros(1,n);
    d = zeros(1,n);
    alfa =  zeros(1,n);
    beta = zeros(1,n);
    gamma = zeros(1,n);
    delta = zeros(1,n);
    for i = 2:n
        h(1,i) = X(i) - X(i-1);
    end
    mu(1,1)=0;
    mu(1,n)=1;
    l(1,1)=1;
    l(1,n)=0;
    for i=2:n-1
        mu(1,i) = h(1,i)/(h(1,i)+h(1,i+1));
        l(1,i) = h(1,i+1)/(h(1,i)+h(1,i+1));
        d(1,i) = (6/(h(1,i)+h(1,i+1)))*(((Y(i+1)-Y(i))/h(i+1))-(Y(i)-Y(i-1))/(h(i)));
    end
    d = d';
    T = eye(n)*2;
    T = T + diag(mu(2:n),-1);
    T = T + diag(l(1:n-1),1);
    M = T\d;
    alfa(1,:) = Y;
    for i=1:n-1
        beta(1,i) = ((Y(i+1) - Y(i))/(h(1,i+1))) - ((2*M(i)+M(i+1))/6)*h(1,i+1);
        gamma(1,i) = M(i)/2;
        delta(1,i) = (M(i+1) - M(i))/(6*(h(1,i+1)));
    end
    C(1,:) = alfa;
    C(2,:) = beta;
    C(3,:) = gamma;
    C(4,:) = delta;
end

