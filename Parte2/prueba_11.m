vector = -30 + 60*rand(1,30);
maxGeneraciones = 10000;
sigma = 0.05;
[allFitness,mejor,solucion] = algoritmo11(vector,maxGeneraciones,3,sigma);

plot(allFitness);

disp('Mejor fitness conseguido');
disp(mejor);