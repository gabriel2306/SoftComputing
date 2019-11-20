vector = -100 + 200*rand(1,30);
[soluciones,iMejor] = algoritmo11(vector,10000);

plot(10000,soluciones);
mejor = iMejor;