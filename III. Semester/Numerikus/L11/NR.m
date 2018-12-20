function [xn,n] = NR( f,fd,xo,e,max )
    n = 2;
    a = 0.5;
    b = pi/4;
    x = a:0.01:b;
    line([a b],[0 0],'Color',[0 0 0]);
    hold on;
    y = fd(xo)*(x-xo) + f(xo);
    plot(x,y);
    pause(2)
    xx = xo - (f(xo)/fd(xo));
    fx = f(x);
    plot(x,fx);
    pause(2);
    y = fd(xx)*(x-xx) + f(xx);
    plot(x,y);
    while(n<max && abs(xx - xo)>e )
        n = n+1;
        xo = xx;
        xx = xo - (f(xo)/fd(xo));
        y = fd(xx)*(x-xx) + f(xx);
        plot(x,y);
        pause(2);
    end
    xn = xx;
end

