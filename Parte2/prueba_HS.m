nVectores = 50;
vectores = cell(1,nVectores);
for i=1:nVectores
    vector = -500 + 1000*rand(1,30);
    vectores{i} = vector;
end

maxGeneraciones = 100000;
sigma = 4;
nFuncion = 2;
[allFitness,mejorFitness,solucion] = algoritmoHS(vectores,maxGeneraciones,nFuncion,sigma);

plot(allFitness);

disp('Mejor fitness conseguido');
disp(mejorFitness);

disp('La solucion es');
disp(solucion);