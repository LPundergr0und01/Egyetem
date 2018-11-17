subplot(1,2,1);
X=BisectionMethod('normal',[0,1],0.01,-2,2,5000);
subplot(1,2,2);
Y=Hur('normal',[0,1],0.01,-2,2,5000);