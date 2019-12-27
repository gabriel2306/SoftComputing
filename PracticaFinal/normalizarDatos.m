function [datosNormalizados, factor] = normalizarDatos(datos)
    tam = size(datos);
    %Meter los años en la primera columna
    resultado = datos(:,1);
    
    factores = [];
    %Normalizamos cada columna
    for i=2:tam(2)
        columna = datos(:,i);
        maximo = max(columna);
        resultado = [resultado, columna./maximo];
        factores = [factores, maximo];
    end
    
    datosNormalizados = resultado;
    factor = factores;
end

