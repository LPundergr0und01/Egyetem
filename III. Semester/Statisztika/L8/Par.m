function X = Par(parameters, n)

    X = zeros(1,n);
    a = parameters(1);
    b = parameters(2);
    if (a <= 0 || b <= 0)
        disp('Wrong parameter!');
    end
    for i=1:n
        U = ULEcuyerRNG();
        X(i) = b/U^(1/a);
    end
end