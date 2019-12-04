vector = -30 + 60*rand(1,30);
maxGeneraciones = 1000000;
sigma = 0.05;
[allFitness,iteracionMejor,solucion] = algoritmo11(vector,maxGeneraciones,3,sigma);

plot(allFitness);

