for i = 10 : 15
    [T1,T2] = vectorGenerator( i );
    V1 = matrixGenerator( T1 );
    V2 = matrixGenerator( T2 );
    i
    [ con ] = condMY( V1 )
    [ con ] = condMY( V2 )
end