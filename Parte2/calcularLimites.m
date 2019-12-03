function [maximo,minimo] = calcularLimites(padres,indice)
    tam = size(padres);
    tam = tam(2);
    padre1 = padres{1};
    maximo = padre1(indice);
    minimo = padre1(indice);
    for i=2:tam
        fila = padres{i};
        maximoLocal = fila(indice);
        minimoLocal = fila(indice);
        if(maximoLocal>maximo)
            maximo = maximoLocal;
        end
        if(minimoLocal<minimo)
            minimo = minimoLocal;
        end
    end
end