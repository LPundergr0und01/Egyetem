A = [10,7,8,7;7,5,6,5;8,6,10,9;7,5,9,10];
B = [32;23;33;31];
BDB = [32.1;22.9;33.1;30.9]-B;
ADB = [10,7,8.1,7.2;7.08,5.04,6,5;8,5.98,9.89,9;6.99,4.99,9,9.89] - A;
X = A\B;

XB = A\(BDB+B);
XA = (A+ADB)\B;
XB = XB - X;
XA = XA - X;
nB = norm(B);
nA = norm(A);
nBDB = norm(BDB);
nADB = norm(ADB);
nXB = norm(XB);
nXA = norm(XA);
nX = norm(X);
h1 = nBDB/nB
h2 = nXB/nX
h3 = nADB/nA
h4 = nXA/nX
cond(A)