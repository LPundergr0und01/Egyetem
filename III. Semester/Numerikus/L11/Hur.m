function [ xn,n ] = Hur( f,x1,x2,e,max )

    n = 3;
    x3 = x2 - ((f(x2)*(x2-x1))/(f(x2)-f(x1)));
    while(n<max && abs(x3 - x2)>e )
        n = n+1;
        x1 = x2;
        x2 = x3;
        x3 = x2 - ((f(x2)*(x2-x1))/(f(x2)-f(x1)));
    end
    xn = x3;
end

