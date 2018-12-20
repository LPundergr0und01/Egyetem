X = [401,399,399,400,402,399,401,400,398,399,401,401,402, 400,401,399,400];
Y = [401,401,400,400,397,398,404,401,404,399,400,400,397, 399,397,401,398,400,399,398];

[ci_f, ci_lambda, f_value, p_value, H] = FTest2D(X, Y, 0.04, 0);

if (H == 1)
    disp('A ket gep hibaja kulonbozik');
    [ci_t, ci_delta, t_value, p_value, H2] = TTest2D(X, Y, 0, 0.01, 0);
    if (H2 == 1)
        disp('Kulonbozik a ket gep altal csomagolt tasakok sulya');
    else
        disp('Nem kulonbozik a ket gep altal csomagolt tasakok sulya');
    end
else
    disp('A hibak nem kulonboznek');
    [ci_t, ci_delta, t_value, p_value, H2] = TTest2D(X, Y, 1, 0.01, 0);
    if (H2 == 1)
        disp('Kulonbozik a ket gep altal csomagolt tasakok sulya');
    else
        disp('Nem kulonbozik a ket gep altal csomagolt tasakok sulya');
    end
end