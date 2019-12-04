nVectores = 100;
vectores = cell(1,nVectores);
for i=1:nVectores
    vector = -100 + 200*rand(1,30);
    vectores{i} = vector;
end

maxGeneraciones = 100000;
sigma = 0.005;
nHijos = 5;
nFuncion = 1;
[allFitness,mejorFitness,solucion] = algoritmoML(vectores,maxGeneraciones,nFuncion,sigma,nHijos);

plot(allFitness);

disp('Mejor fitness conseguido');
disp(mejorFitness);

disp('La solucion es');
disp(solucion);