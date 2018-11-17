function [ T1,T2 ] = vectorGenerator( n )
    T1 = zeros(1,n);
    T2 = zeros(1,n);
    for i=0:n
        T1(1,i+1) = (-1+i*(2/n));
        if i >0 
            T2(1,i) = (i/n);
        end
    end
end

