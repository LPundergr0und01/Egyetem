function [ sinn,n ] = L2( x,e )
    x = x - 2*pi*(floor(x/(2*pi)));
    xx = x;
    n = 0;
    s = 0;
    while abs(xx) > e
        n = n + 1;
        s = s + xx;
        xx = xx * ((x^2)/((2*n)*(2*n+1))) * -1;
    end
    sinn = s;
end

