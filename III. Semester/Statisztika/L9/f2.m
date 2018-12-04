X = [98.2,99.6,100.1,100.4,99.2,99.8,99.6,99.5,98.7,99.8,100.2, 98.7,100.3,99.7,100.0,99.8]; 
Y = [98.5,96.8,100.3,97.9,99.3,100.5,100.2,99.4,98.7,98.1,98.0, 99.3,98.1,97.5,100.3,96.5];

s1 = 0.62;
s2 = 1.25;
a = 0.03;
mu0 = 100;

[ci_u, ci_mu, u_value, p_value, H1] = UTest(X, mu0, s1, a, 0);
[ci_u, ci_mu, u_value, p_value, H2] = UTest(Y, mu0, s2, a, 0);

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

[ci_u, ci_delta, u_value, p_value, Hk] = UTest2D(X, Y, s1, s2, a, 0);
[ci_u, ci_delta, u_value, p_value, Hj] = UTest2D(X, Y, s1, s2, a, 1);

if (Hk == 0)
    disp('dontetlen');
else if (Hj == 1)
        disp('Az elso nyert');
    else
        disp('A masodik nyert');
    end
end