X = [39.7,38.7,37.9,38.8,39.7,39.8,38.2,38.6,38.8,39.0,38.5,38.2,37.6];
Y = [39.6,37.2,36.8,37.9,38.2,38.8,38.0,38.3,37.8,37.9,37.6,38.4,37.8];
a = 0.2;

s1 = var(X);
s2 = var(Y);

s = s1-s2;
s = abs(s);

ep = 0.1;

if (s < ep)
    e = 1;
else
    e = 0;
end

[ci_u, ci_delta, u_value, p_value, H] = TTest2D(X,Y,e,a,1);

if (H == 1)
    disp('Hatott');
else
    disp('Nem hatott');
end
