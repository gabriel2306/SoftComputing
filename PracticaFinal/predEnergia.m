datos = csvread('data.csv',1,0);

[datosNormalizados factorNormalizado] = normalizarDatos(datos);

[varTrain, enTrain] = separarDatosTrain(datosNormalizados);
[varTest, enTest] = separarDatosTest(datosNormalizados);

nCaracteristicas = 6;
nPadres = 50;
armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres);

maxIteraciones = 500000;
varianza = 0.1;
[allFitness,mejorFitness,solucion] = algoritmoHS(varTrain,enTrain,armoniaInicial,maxIteraciones,varianza);
enCalculadaTrain = calcularDemanda(varTrain, solucion);
disp(mejorFitness);

enCalculadaTest = calcularDemanda(varTest, solucion);
errorTest = funcionMinimizar(enTest, enCalculadaTest);
disp(errorTest);

subplot(2,1,1)
plot(1:13,enTrain.*factorNormalizado(1),1:13,enCalculadaTrain.*factorNormalizado(1));
title('TRAIN');
legend('Real','Calculada');

subplot(2,1,2)
plot(1:13,enTest.*factorNormalizado(1),1:13,enCalculadaTest.*factorNormalizado(1));
title('TEST');
legend('Real','Calculada');