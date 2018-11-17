function L1_1(A)

n = size(A);
if (n(1)~=n(2))
    error('nem negyzetes a matrix');
end
    
    for i=1:n
        if (sum(abs(A(i,:)))-abs(A(i,i))>=abs(A(i,i)))
            error('nem dominans');
        end
    end
end

