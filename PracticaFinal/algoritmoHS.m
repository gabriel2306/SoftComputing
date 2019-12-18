function [allFitness,mejorFitness,solucion] = algoritmoHS(varTrain,enTrain,padres,maxIteraciones,varianza,linealizar,nCaracteristicas)
    %Calcular el error producido por todos los padres
    errorPadres = evaluarAux(padres,varTrain,enTrain);
    
    %Obtener el error minimo
    minimoPadres = min(errorPadres);
    
    %El mejor fitness conseguido hasta el momento es el m�nimo
    mejorFitness = minimoPadres;
    
    %Vector para guardar los mejores fitness conseguidos durante la
    %ejecuci�n
    allFitness = [];
    
    %Realizamos el algoritmo hasta el m�ximo de iteraciones indicado
    for j=1:maxIteraciones
        
        %Guardamos el fitness del mejor padre
        allFitness = [allFitness; mejorFitness];

        %Generamos una nueva armonia
        hijo = generarHijoRSR(padres,varianza);
        
        % Los exponentes del modelo se ponene a 1
        if linealizar
           hijo = linealizarPesos(hijo,nCaracteristicas); 
        end

        %Calculamos el error del hijo
        enCalculadaHijo = calcularDemanda(varTrain, hijo);
        errorHijo = funcionMinimizar(enTrain, enCalculadaHijo);
        
        %Obtenemos el error maximo de los padres y su posici�n
        [valorPeorPadres, posPeorPadre]= max(errorPadres);
        
        %Si el hijo generado es mejor que el peor padre, se cambian
        if(valorPeorPadres>errorHijo)
            %Cambio
            padres{posPeorPadre} = hijo;
            
            %Calculamos otra vez los valores de los nuevos padres
            errorPadres = evaluarAux(padres,varTrain,enTrain);
            
            %Obtenemos el error m�nimo y la posici�n del padre que lo
            %genera
            [minimoPadres, posMinimoPadres] = min(errorPadres);
            mejorFitness = minimoPadres;
            
            %La soluci�n hasta el momento es el padre cuyo error producido
            %es el menor
            solucion = padres{posMinimoPadres};
        end
    end
end

%Genera hijo con mutaci�n gaussiana
function [hijo] = generarHijoRSR(padres,varianza)
    %Creaci�n de un hijo vac�o
    hijo = [];
    
    %Tama�o de un solo padre
    tam = size(padres{1});
    tam = tam(2);
    
    %Conocer el n�mero de padres totales
    tamColumnas = size(padres);
    tamColumnas = tamColumnas(2);
    
    for i = 1:tam
        %Obtener l�mites para los pesos aleatorios
        [minimo,maximo] = limitesPesos(i);
        
        %Obtener probabilidad para HMCR
        probHMCR = rand;
        
        %Probabilidad HMCR para generar nota
        if(probHMCR<0.8)
            %Nota aleatoria de la misma columna de Harmony Memory
            numAleatorioFila = randi(tamColumnas);
            %Coger fila completa aleatoria
            fila = padres{numAleatorioFila};
            %Valor de la fila a introducir en el hijo
            valor = fila(i);           
        else
            %Nota aleatoria en el rango de la misma columna
            valor = minimo + (maximo-minimo)*rand;
        end
        
        %Obtener probabilidad para PAR
        probPAR = rand;
        
        if(probPAR<0.3)
            %Mutamos nota
            ruido = 0 + varianza*rand;
            valor = valor + ruido;
            
            %Comprobar que el valor no se sale de los l�mites del peso
            valor = comprobarValor(valor, minimo, maximo);
        end
        hijo = [hijo,valor];
    end 

    %Obtener probabilidad para RSR
    probCambio = rand;
    
    if(probCambio<0.01)
        %Reemplazamos num aleatorio de notas por un num aleatorio en el
        %rango de su misma columna
        for i=1:randi(tam)
            posicionAleatoria = randi(tam);
            
            %Obtener l�mites para los pesos aleatorios
            [minimo,maximo] = limitesPesos(posicionAleatoria);
            
            valor = rand*(maximo-minimo)+minimo;
            hijo(posicionAleatoria) = valor;
        end
    end
end

%Evalua los padres o hijos
function errores = evaluarAux(padres,varTrain,enTrain)
    errores = [];
    tam = size(padres);
    
    for i=1:tam(2)
        enCalculada = calcularDemanda(varTrain, padres{i});
        errores = [errores, funcionMinimizar(enTrain, enCalculada)];
    end
end