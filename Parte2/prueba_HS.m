nVectores = 100;
vectores = cell(1,nVectores);
for i=1:nVectores
    vector = -100 + 200*rand(1,30);
    vectores{i} = vector;
end

<<<<<<< HEAD
maxGeneraciones = 5000;
=======
maxGeneraciones = 1000000;
>>>>>>> 04d74ac78d38e83f2265a4c2e861392493eb193a
sigma = 0.005;
nFuncion = 1;
[allFitness,mejorFitness,solucion] = algoritmoHS(vectores,maxGeneraciones,nFuncion,sigma);

plot(allFitness);

disp('Mejor fitness conseguido');
disp(mejorFitness);

disp('La solucion es');
disp(solucion);