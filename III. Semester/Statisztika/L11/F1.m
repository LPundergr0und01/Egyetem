X = [449,448,450,449,450,451,449,451,450,451,450,450, 448,452,450,448,451,449,448,449,450,449,450,451];

[ci_chi2, ci_std, chi2_value, p_value, H] = Chi2Test(X, 1.6, 0.05, 1);

if (H ==1)
    disp('A gep javitasra szorul');
else 
    disp('A gep nem szorul javitasra');
end
