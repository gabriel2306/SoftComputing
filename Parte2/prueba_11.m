vector = -30 + 60*rand(1,30);
<<<<<<< HEAD
maxGeneraciones = 10000;
sigma = 0.05;
[allFitness,mejor,solucion] = algoritmo11(vector,maxGeneraciones,3,sigma);

plot(allFitness);

disp('Mejor fitness conseguido');
disp(mejor);
=======
maxGeneraciones = 1000000;
sigma = 0.05;
[allFitness,iteracionMejor,solucion] = algoritmo11(vector,maxGeneraciones,3,sigma);

plot(allFitness);

>>>>>>> 04d74ac78d38e83f2265a4c2e861392493eb193a
