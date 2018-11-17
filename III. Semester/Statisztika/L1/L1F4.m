function [ P ] = L1F4()
    init = 0;
    t = 0;
    for i= 1:100000
        [X] = URealRNG(init,3,0,1,10);
        a = 0;
        b = 0;
        c = 0;
        for j = 1:10
            aa = (10-b)/(30-j+1);
            bb = (4-c)/(30-j+1);
            if (X(j)<bb)
                c = c + 1;
            else
                if (X(j)<aa)
                    b = b + 1;
                else
                    a = a + 1;
                end
            end
            if (a == 7) && (b == 2) && (c == 1)
                t = t + 1;
            end
        end
    end
    P = t / 100000;
end

