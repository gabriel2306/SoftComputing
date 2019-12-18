datos = csvread('data.csv',1,0);

[datosNormalizados, factoresNormalizado] = normalizarDatos(datos);
factorNormalizadoEnergia = factoresNormalizado(1);

[varTrain, enTrain] = separarDatosTrain(datosNormalizados);
[varTest, enTest] = separarDatosTest(datosNormalizados);

nCaracteristicas = 6;
nPadres = 10;
armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres);

maxIteraciones = 10000;
varianza = 0.1;

errorMinimo = 10;

for i=1:3
    [allFitness,mejorFitness,solucion] = algoritmoHS(varTrain,enTrain,armoniaInicial,maxIteraciones,varianza);
    
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
plot(1:13,enTrain.*factorNormalizadoEnergia,'-+',1:13,enCalculadaTrain.*factorNormalizadoEnergia,'-o');
title('TRAIN');
legend('Real','Calculada');

subplot(2,1,2)
plot(1:13,enTest.*factorNormalizadoEnergia,'-+',1:13,enCalculadaTest.*factorNormalizadoEnergia,'-o');
title('TEST');
legend('Real','Calculada');
