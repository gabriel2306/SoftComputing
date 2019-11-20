function [soluciones,mejor] = algoritmoHS(vectores,gmax,nFuncion,sigma)
    padres = vectores;
    varianza = sigma;
    valoresPadres = evaluarAux(padres,nFuncion);
    minimoPadres = min(valoresPadres);
    mejor = minimoPadres;
    soluciones = [];
    for j=1:gmax
        soluciones = [soluciones; mejor];
        hijo = generarHijo(padres,varianza);
        valorHijo = evaluarFuncion(hijo,nFuncion);
        
        [valorPeorPadres, padre]= max(valoresPadres);
        if(valorPeorPadres>valorHijo)
            padres{padre} = hijo;
            valoresPadres = evaluarAux(padres,nFuncion);
            minimoPadres = min(valoresPadres);
            mejor = minimoPadres;
        end
    end

end

function [hijo] = generarHijo(padres,varianza)
    hijo = [];
    tam = size(padres{1});
    tamColumnas = size(padres);
    tamColumnas = tamColumnas(2);
    for i = 1:tam(2)
        prob = rand;
        if(prob<0.8)
            numAleatorioFila = randi(tamColumnas);
            fila = padres{numAleatorioFila};
            valor = fila(i);           
        else
            [maximo,minimo] = calcularLimites(padres);
            valor = rand*(maximo-minimo)+minimo;
        end
        if(prob<0.3)
            ruido = 0 + varianza*rand;
            valor = valor + ruido;
        end
        hijo = [hijo,valor];
    end 
end

function [eval] = evaluarFuncion(vector, nFuncion)
    aux = 0;
    switch nFuncion
        case 1
            aux = funcion1(vector);
        case 2
            aux = funcion2(vector);
        case 3
            aux = funcion3(vector);
    end
    
    eval = aux;
end

%Evalua los padres o hijos
function [valores] = evaluarAux(padres,nFuncion)
    valores = [];
    tam = size(padres);
    
    for i=1:tam(2)
        valores = [valores,evaluarFuncion(padres{i},nFuncion)];
    end
end

function [maximo,minimo] = calcularLimites(padres)
    tam = size(padres);
    tam = tam(2);
    padre1 = padres{1};
    maximo = padre1(1);
    minimo = padre1(1);
    for i=1:tam
        maximoLocal = max(padres{i});
        minimoLocal = min(padres{i});
        if(maximoLocal>maximo)
            maximo = maximoLocal;
        end
        if(minimoLocal<minimo)
            minimo = minimoLocal;
        end
    end
end