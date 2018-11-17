function [P] = L1F3( d )
    init = 0;
    t = 0;
    hold on;
    for i=1:10000
        [X] = URealRNG(init,3,0,d,2);
        a = sqrt(X(1)^2 + (X(2)-d/2)^2);
        b = sqrt((X(1)-d/2)^2 + X(2)^2);
        if a > d/2 && b > d/2
            t = t + 1;
            plot(X(1),X(2),'.','color','green');
         else
            plot(X(1),X(2),'.','color','red');
        end
    end
    P = t / 10000;
end

