function [allFitness,mejorFitness,solucion] = algoritmoHS(vectores,gmax,nFuncion,sigma)
    padres = vectores;
    varianza = sigma;
    valoresPadres = evaluarAux(padres,nFuncion);
    minimoPadres = min(valoresPadres);
    mejorFitness = minimoPadres;
    allFitness = [];
    for j=1:gmax
        allFitness = [allFitness; mejorFitness];%Guardamos el fitness del mejor padre
        hijo = generarHijoRSR(padres,varianza);%Generamos nueva armon�a
        valorHijo = evaluarFuncion(hijo,nFuncion);
        
        [valorPeorPadres, padre]= max(valoresPadres);
        %Cambiamos al peor padre si es mejor el hijo (armon�a) generado
        if(valorPeorPadres>valorHijo)
            padres{padre} = hijo;
            valoresPadres = evaluarAux(padres,nFuncion);
            [minimoPadres,posMinimoPadres] = min(valoresPadres);
            mejorFitness = minimoPadres;
            solucion = padres{posMinimoPadres};
        end
    end

end

%Genera hijo con mutaci�n gaussiana
function [hijo] = generarHijoRSR(padres,varianza)
    hijo = [];
    tam = size(padres{1});
    tamColumnas = size(padres);
    tamColumnas = tamColumnas(2);
    
    for i = 1:tam(2)
        [maximo,minimo] = calcularLimites(padres,i);
        prob = rand;
        %Probabilidad HMCR para generar nota
        if(prob<0.8)
            %Nota aleatoria de la misma columna de Harmony Memory
            numAleatorioFila = randi(tamColumnas);
            fila = padres{numAleatorioFila};
            valor = fila(i);           
        else
            %Nota aleatoria en el rango de la misma columna
            valor = minimo + (maximo-minimo)*rand;
        end
        %Probabilidad PAR
        if(prob<0.2)
            %Mutamos nota
            ruido = 0 + varianza*rand;
            valor = valor + ruido;
        end
        hijo = [hijo,valor];
    end 
    
    tamHijo = size(hijo);
    probCambio = rand;
    %Probabilidad RSR
    if(probCambio<0.01)
        %Reemplazamos num aleatorio de notas por un num aleatorio en el
        %rango de su misma columna
        for i=1:randi(tamHijo(2))
            posicionAleatoria = randi(tamHijo(2));
            [maximo,minimo] = calcularLimites(padres,posicionAleatoria);
            hijo(posicionAleatoria) = rand*(maximo-minimo)+minimo;
        end
    end
end

%Generamos resultado de funci�n objetivo del individuo
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

%Calcula maximo y minimo de una columna concreta de una matriz
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