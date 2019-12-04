function [allFitness,fitness,hijoMejor] = algoritmo11(vector,gmax,nFuncion,sigma)
    padre = vector;
    minimoActual = evaluarFuncion(padre, nFuncion);
    
    allFitness = [];
    varianza = sigma;
    
    for i=1:gmax
        allFitness = [allFitness; minimoActual]; %Guardamos el fitness del padre
        hijo = generarHijo(padre,varianza,nFuncion); %Geneamos hijo
        minimoHijo = evaluarFuncion(hijo,nFuncion); %Generamos resultado de función a optimizar del hijo
        
        if(minimoHijo<minimoActual) %Si el hijo es mejor que el padre, se sustituye
            minimoActual = minimoHijo;
            hijoMejor = hijo;
            padre = hijo;
            fitness = minimoActual;
        end
    end
end

%Generamos hijo con mutación gaussiana
function [hijo] = generarHijo(padre,varianza,funcion)
    ruido = 0 + varianza*randn(1,30);
    hijo = padre + ruido;
    hijo = comprobarHijo(hijo,funcion);
end

function [hijo] = comprobarHijo(hijo,nFuncion)
    [limiteInferior, limiteSuperior] = limitesFunciones(nFuncion);
    
    for i=1:30
        if(hijo(i)<limiteInferior)
            hijo(i) = limiteInferior;
        end
        if(hijo(i)>limiteSuperior)
            hijo(i) = limiteSuperior;
        end        
    end    
end