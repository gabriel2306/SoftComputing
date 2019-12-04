function [allFitness,fitness,hijoMejor] = algoritmo11(vector,gmax,nFuncion,sigma)
    padre = vector;
    minimoActual = evaluarFuncion(padre,nFuncion);
    
    allFitness = [];
    varianza = sigma;
    
    for i=1:gmax
        allFitness = [allFitness; minimoActual]; %Guardamos el fitness del padre
        hijo = generarHijo(padre,varianza,nFuncion); %Geneamos hijo
        minimoHijo = evaluarFuncion(hijo,nFuncion); %Generamos resultado de funci�n a optimizar del hijo
        
        if(minimoHijo<minimoActual) %Si el hijo es mejor que el padre, se sustituye
            minimoActual = minimoHijo;
            hijoMejor = hijo;
            padre = hijo;
            fitness = minimoActual;
        end
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