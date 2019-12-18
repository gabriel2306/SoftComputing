function demandasCalculadas = calcularDemanda(varReales, varPredictivas)
    conjuntoCalculado = [];
    tam = length(varReales);
    for i=1:tam
        conjuntoCalculado = [conjuntoCalculado; cDemandaAux(varReales(i,:),varPredictivas)];
    end

    demandasCalculadas = conjuntoCalculado;
end

function demandaCalculada = cDemandaAux(varReales, varPredictivas)
    %varPredictivas son los pesos de la armonía
    suma = 0;
    tam = length(varReales);
    for i=2:tam
        suma = suma + varPredictivas(i)*(varReales(i)^(varPredictivas(i+tam)));
    end
    
    %La bia se encuentra en la primera posición del vector
    demandaCalculada = suma + varPredictivas(1);
end