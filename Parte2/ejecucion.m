% Funcion a evaluar
nFuncion = 3;

% Limites
if (nFuncion==1)
    limiteInferior = -100;
    limiteSuperior = 100;
end

if (nFuncion==2)
    limiteInferior = -500;
    limiteSuperior = 500;
end
    
if (nFuncion==3)
    limiteInferior = -30;
    limiteSuperior = 30;
end

% Parametros
sigma11 = 0.05;
maxGeneraciones11 = 10000;

sigmaML = 0.01;
maxGeneracionesML = 10000;

sigmaHS = 0.01;
maxGeneracionesHS = 10000;

% 1+1
vector = limiteInferior + (limiteSuperior-limiteInferior)*rand(1,30);
tic
[allFitness,mejorFitness,solucion] = algoritmo11(vector,maxGeneraciones11,nFuncion,sigma11);
bestFitness11 = mejorFitness;
allFitness11 = allFitness;
solucion11 = solucion;
fitnessIteraciones11 = [mejorFitness];
for i=1:5
    [allFitness,mejorFitness,solucion] = algoritmo11(vector,maxGeneraciones11,nFuncion,sigma11);
    fitnessIteraciones11 = [fitnessIteraciones11 mejorFitness];
    if (mejorFitness<bestFitness11)
        bestFitness11 = mejorFitness;
        allFitness11 = allFitness;
        solucion11 = solucion;
    end 
end
toc

nVectores = 50;
vectores = cell(1,nVectores);
nHijos = 5;
for i=1:nVectores
    vector = limiteInferior + (limiteSuperior-limiteInferior)*rand(1,30);
    vectores{i} = vector;
end

% M+L
tic
[allFitness,mejorFitness,solucion] = algoritmoML(vectores,maxGeneracionesML,nFuncion,sigmaML,nHijos);
bestFitnessML = mejorFitness;
allFitnessML = allFitness;
solucionML = solucion;
fitnessIteracionesML = [mejorFitness];
for i=1:5
    [allFitness,mejorFitness,solucion] = algoritmoML(vectores,maxGeneracionesML,nFuncion,sigmaML,nHijos);
    fitnessIteracionesML = [fitnessIteracionesML mejorFitness];
    if (mejorFitness<bestFitnessML)
        bestFitnessML = mejorFitness;
        allFitnessML = allFitness;
        solucionML = solucion;
    end 
end
toc

% HS
tic
[allFitness,mejorFitness,solucion] = algoritmoHS(vectores,maxGeneracionesHS,nFuncion,sigmaHS);
bestFitnessHS = mejorFitness;
allFitnessHS = allFitness;
solucionHS = solucion;
fitnessIteracionesHS = [mejorFitness];
for i=1:5
    [allFitness,mejorFitness,solucion] = algoritmoHS(vectores,maxGeneracionesHS,nFuncion,sigmaHS);
    fitnessIteracionesHS = [fitnessIteracionesHS mejorFitness];
    if (mejorFitness<bestFitnessHS)
        bestFitnessHS = mejorFitness;
        allFitnessHS = allFitness;
        solucionHS = solucion;
    end 
end
toc

% Representacion
subplot(3,1,1)
plot(allFitness11);
title('1+1');
disp('Mejor');
disp(bestFitness11);
disp('Media');
disp(mean(fitnessIteraciones11));

subplot(3,1,2);
plot(allFitnessML);
title('M+L');
disp('Mejor');
disp(bestFitnessML);
disp('Media');
disp(mean(fitnessIteracionesML));

subplot(3,1,3);
plot(allFitnessHS);
title('HS');
disp('Mejor');
disp(bestFitnessHS);
disp('Media');
disp(mean(fitnessIteracionesHS));