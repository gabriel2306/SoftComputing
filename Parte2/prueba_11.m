vector = -100 + 200*rand(1,30);
maxGeneraciones = 10000;
sigma = 0.5;
[soluciones,mejor] = algoritmo11(vector,maxGeneraciones,1,sigma);

plot(soluciones);
mejorFitness = mejor;

disp(mejorFitness);