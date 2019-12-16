datos = csvread('data.csv',1,0);

[datosNormalizados factorNormalizado] = normalizarDatos(datos);

[varTrain, enTrain] = separarDatosTrain(datosNormalizados);
[varTest, enTest] = separarDatosTest(datosNormalizados);

nCaracteristicas = 6;
nPadres = 500;
armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres);

maxIteraciones = 10000;
varianza = 0.1;

errorMinimo = 10;

for i=0:1
    [allFitness,mejorFitness,solucion] = algoritmoHS(varTrain,enTrain,armoniaInicial,maxIteraciones,varianza);
    
    if(mejorFitness<errorMinimo)
        errorMinimo = mejorFitness;
        solucionMejor = solucion;
    end
end
disp(mejorFitness);

enCalculadaTrain = calcularDemanda(varTrain, solucionMejor);
enCalculadaTest = calcularDemanda(varTest, solucionMejor);
errorTest = funcionMinimizar(enTest, enCalculadaTest);
disp(errorTest);

subplot(2,1,1)
plot(1:13,enTrain.*factorNormalizado(1),'-o',1:13,enCalculadaTrain.*factorNormalizado(1),'-o');
title('TRAIN');
legend('Real','Calculada');

subplot(2,1,2)
plot(1:13,enTest.*factorNormalizado(1),'-o',1:13,enCalculadaTest.*factorNormalizado(1),'-o');
title('TEST');
legend('Real','Calculada');
