function [allFitness,mejorFitness,solucion] = algoritmoML(vectores,gmax,nFuncion,sigma,nHijos)
    padres = vectores;

    valoresPadres = evaluarAux(padres,nFuncion);
    minimoPadres = min(valoresPadres);
   
    allFitness = [];
    varianza = sigma;
    for j=1:gmax
        allFitness = [allFitness;minimoPadres]; %Guardamos el fitness del mejor padre
        padres = obtenerNuevosPadres(padres,nHijos,varianza,nFuncion,valoresPadres);
        
        valoresPadres = evaluarAux(padres,nFuncion);
        [minimoPadres posicionMinimo] = min(valoresPadres); %Obtenemos el mejor fitness de los padres
        mejorFitness = minimoPadres;
        solucion = padres{posicionMinimo}; %Mejor padre
    end
end

%Generamos hijo con mutaci�n gaussiana
function [hijo] = generarHijo(padre,varianza,funcion)
    ruido = 0 + varianza*randn(1,30);
    hijo = padre + ruido;
    hijo = comprobarHijo(hijo,funcion);
end

function [hijo] = comprobarHijo(hijo,nFuncion)
    if (nFuncion==1)
        limiteInferior = -100;
        limiteSuperior = 100;
    end

    if (nFuncion==2)
        limiteInferior = -500;
        limiteSuperior = 500;
    end

    if (nFuncion==3)
        limiteInferior = -30;
        limiteSuperior = 30;
    end
    
    for i=1:30
        if(hijo(i)<limiteInferior)
            hijo(i) = limiteInferior;
        end
        if(hijo(i)>limiteSuperior)
            hijo(i) = limiteSuperior;
        end        
    end    
end

%Genera resultado de funci�n objetivo de un individuo
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

%Genera hijos de un padre
function [hijos] = generarHijosAux(padre,nHijos,varianza,nFuncion)
    hijos = cell(1,nHijos);
    for i=1:nHijos
        hijos{i} = generarHijo(padre,varianza,nFuncion);
    end
end

function [padres] = obtenerNuevosPadres(padres,nHijos,varianza,nFuncion,valoresPadres)
    nPadres = size(padres);
    for i = 1:nPadres(2)
        hijos = generarHijosAux(padres{i},nHijos,varianza,nFuncion); %Generamos hijo de un padre
        valoresHijos = evaluarAux(hijos,nFuncion); %Generamos los resultados de la funci�n objetivo de los hijos
        [valorHijoMinimo posicionHijoMinimo] = min(valoresHijos); %Valor minimo del hijo
        if(valorHijoMinimo<valoresPadres(i))%Si el mejor hijo es mejor que el padre lo sustituimos
            padres{i} = hijos{posicionHijoMinimo};
        end
    end
end
