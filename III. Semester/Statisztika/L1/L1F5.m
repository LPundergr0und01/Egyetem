function [ round_avarage,p1_avarage,p2_avarage ] = L1F5(  )
n = 0;
p1 = 0;
p2 = 0;
init = 0;
for i = 1 :10000
    r = 0;
    while(true)
        n = n + 1;
        r = r + 1;
        [X] = URealRNG(init,3,0,1,1);
        if X(1) <=1/3
            if (mod(r,2)==1)
                p1 = p1 + 1;
                break;
            else
                p2 = p2 + 1;
                break;
            end
        end
    end
end
round_avarage = n / 10000;
p1_avarage = p1 / 10000;
p2_avarage = p2 / 10000;
end

