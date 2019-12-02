vector = -100 + 200*rand(1,30);
maxGeneraciones = 10000;
sigma = 0.5;
[allFitness,iteracionMejor,solucion] = algoritmo11(vector,maxGeneraciones,1,sigma);

plot(allFitness);

disp('Mejor fitness conseguido');
disp(allFitness(iteracionMejor));

disp('La solucion es');
disp(solucion);