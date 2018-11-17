function x = Csonkolas( p,n )
%#4.Feladat
x=ExactInversion('exponential',-log(1-p),n);
x=ceil(x);
hist(x);

end