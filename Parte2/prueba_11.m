vector = -100 + 200*rand(1,30);
maxGeneraciones = 10000;
[soluciones,mejor] = algoritmo11(vector,maxGeneraciones);

plot(soluciones);
mejorFitness = mejor;

disp(mejorFitness);