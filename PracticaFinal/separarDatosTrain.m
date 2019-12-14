function [varTrain, enTrain] = separarDatosTrain(datosNormalizados)
    % -- Entrenamiento --
    % Variables de a�os impares
    varTrain = datosNormalizados(2:2:end,:);
    varTrain = varTrain(:,3:end);

    % Resultado de a�os pares
    enTrain = datosNormalizados(3:2:end,:);
    enTrain = enTrain(:,2);
end

