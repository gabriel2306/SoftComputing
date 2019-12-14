function [varTest, enTest] = separarDatosTest(datosNormalizados)
    % -- Test --
    % Variables de años pares
    varTest = datosNormalizados(1:2:end,:);
    varTest = varTest(:,3:end);
    varTest = varTest(1:(length(varTest)-1),:);

    % Resultado de años impares
    enTest = datosNormalizados(2:2:end,:);
    enTest = enTest(:,2);
end