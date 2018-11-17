function GaussElimSolve( A,b )
    n = size(A);
    n = n(1);
   [U,c]=GaussElim(A,b);
    p = rank(U);
    if ( p == n)
        x = UTriangSolve( U , c );
    else
        cc = abs(c(p+1:n));
        cc = sum(cc);
        if (cc == 0)
            disp('compatibilis es hatarozatlan');
        else
            disp('incompatibilis');
        end
    end

end

