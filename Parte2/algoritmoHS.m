function [allFitness,mejorFitness,solucion] = algoritmoHS(vectores,gmax,nFuncion,sigma)
    padres = vectores;
    varianza = sigma;
    valoresPadres = evaluarAux(padres,nFuncion);
    minimoPadres = min(valoresPadres);
    mejorFitness = minimoPadres;
    allFitness = [];
    for j=1:gmax
        allFitness = [allFitness; mejorFitness];%Guardamos el fitness del mejor padre

        hijo = generarHijoRSR(padres,varianza,nFuncion);%Generamos nueva armon�a
        valorHijo = evaluarFuncion(hijo, nFuncion);
        
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
function [hijo] = generarHijoRSR(padres,varianza,nFuncion)
    hijo = [];
    tam = size(padres{1});
    tamColumnas = size(padres);
    tamColumnas = tamColumnas(2);
    
    [maximo,minimo] = limitesFunciones(nFuncion);
    
    for i = 1:tam(2)
        prob = rand;
        %Probabilidad HMCR para generar nota
        if(prob<0.9)
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
            hijo(posicionAleatoria) = rand*(maximo-minimo)+minimo;
        end
    end
end

%Evalua los padres o hijos
function [valores] = evaluarAux(padres,nFuncion)
    valores = [];
    tam = size(padres);
    
    for i=1:tam(2)
        valores = [valores,evaluarFuncion(padres{i},nFuncion)];
    end
end