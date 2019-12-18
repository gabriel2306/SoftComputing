datos = csvread('data.csv',1,0);

[datosNormalizados, factoresNormalizado] = normalizarDatos(datos);
factorNormalizadoEnergia = factoresNormalizado(1);

annosTrain = 1992:2:2016;
annosTest = 1991:2:2015;

[varTrain, enTrain] = separarDatosTrain(datosNormalizados);
[varTest, enTest] = separarDatosTest(datosNormalizados);

% Linealizar Modelo (true/false)
linealizar = false;

nCaracteristicas = 6;
nPadres = 10;
armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres, linealizar);

maxIteraciones = 10000;
varianza = 0.01;

errorMinimo = 10;

for i=1:3
    [allFitness,mejorFitness,solucion] = algoritmoHS(varTrain,enTrain,armoniaInicial,maxIteraciones,varianza,linealizar,nCaracteristicas);
    
    if(mejorFitness<errorMinimo)
        errorMinimo = mejorFitness;
        solucionMejor = solucion;
    end
end
disp(errorMinimo*factorNormalizadoEnergia^2);
enCalculadaTrain = calcularDemanda(varTrain, solucionMejor);

enCalculadaTest = calcularDemanda(varTest, solucionMejor);
errorTest = funcionMinimizar(enTest, enCalculadaTest);
disp(errorTest*factorNormalizadoEnergia^2);

subplot(2,1,1)
plot(annosTrain,enTrain.*factorNormalizadoEnergia,'-+',annosTrain,enCalculadaTrain.*factorNormalizadoEnergia,'-o');
title('TRAIN');
legend('Real','Calculada');

subplot(2,1,2)
plot(annosTest,enTest.*factorNormalizadoEnergia,'-+',annosTest,enCalculadaTest.*factorNormalizadoEnergia,'-o');
title('TEST');
legend('Real','Calculada');
