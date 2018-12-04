X = [331.13,333.85,328.26,331.81,330.67,327.85,329.09,330.72,332.51, 330.82,327.17,336.37,331.52,329.87,331.50];
Y = [332.75,327.44,326.69,327.49,320.87,334.46,331.01,327.66,334.25, 324.69,329.68,329.25,330.99,330.97,327.32];
a = 0.02;
[ci_u, ci_delta, u_value, p_value, H] = TTest2D(X,Y,0,a,0);

if (H == 0)
    disp('Nem tolt tobbet a masodik');
else
    disp('A masodik tobbet tolt');
end


X = [98.2,99.6,100.1,100.4,99.2,99.8,99.6,99.5,98.7,99.8,100.2, 98.7,100.3,99.7,100.0,99.8]; 
Y = [98.5,96.8,100.3,97.9,99.3,100.5,100.2,99.4,98.7,98.1,98.0, 99.3,98.1,97.5,100.3,96.5];

a = 0.03;
mu0 = 100;

[ci_u, ci_mu, u_value, p_value, H1] = TTest(X, mu0, a, 0);
[ci_u, ci_mu, u_value, p_value, H2] = TTest(Y, mu0, a, 0);

if (H1 == 0)
    disp('Az elso cukrasz sutije valoban 100g');
else
    disp('Az elso cukrasz sutije nem 100g');
end

if (H2 == 0)
    disp('A masodik cukrasz sutije valoban 100g');
else
    disp('A masodik cukrasz sutije nem 100g');
end

[ci_u, ci_delta, u_value, p_value, Hk] = TTest2D(X, Y, 0, a, 0);
[ci_u, ci_delta, u_value, p_value, Hj] = TTest2D(X, Y, 0, a, 1);

if (Hk == 0)
    disp('dontetlen');
else if (Hj == 1)
        disp('Az elso nyert');
    else
        disp('A masodik nyert');
    end
end