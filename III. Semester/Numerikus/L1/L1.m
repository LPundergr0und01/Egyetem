function L1(A)

n=size(A)
if (n(1)~=n(2))
    disp('nem negyzetes a matrix')
    return
end
    
    for i=1:n
        if (sum(abs(A(i,:)))-abs(A(i,i))>abs(A(i,i)))
            disp('nem Dominans foatloju')
            return  
        end
    end
disp('dominans foatloju')
