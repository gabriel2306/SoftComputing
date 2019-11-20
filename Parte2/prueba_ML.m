nVectores = 10;
vectores = cell(1,nVectores);
for i=1:nVectores
    vector = -100 + 200*rand(1,30);
    vectores{i} = vector;
end

maxGeneraciones = 10000;
sigma = 0.5;
nHijos = 10;
nFuncion = 1;
[soluciones,mejor] = algoritmoML(vectores,maxGeneraciones,nFuncion,sigma,nHijos);

plot(soluciones);
mejorFitness = mejor;

disp(mejorFitness);