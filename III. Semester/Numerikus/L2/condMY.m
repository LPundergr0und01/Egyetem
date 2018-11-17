function [ con ] = condMY( A )
    con = norm(A,Inf)*norm(inv(A),Inf);
end

