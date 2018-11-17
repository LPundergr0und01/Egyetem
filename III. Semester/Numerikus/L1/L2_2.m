function [ coss,n ] = L2_2( x,e )
    x = x - 2*pi*(floor(x/(2*pi)));
    xx = 1;
    n = 0;
    c = 0;
    while abs(xx) > e
        n = n + 1;
        c = c + xx;
        xx = xx * ((x^2)/((2*n)*(2*n-1))) * -1;
    end
    coss = c;
end

