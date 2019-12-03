function [allFitness,fitness,hijoMejor] = algoritmo11(vector,gmax,nFuncion,sigma)
    padre = vector;
    minimoActual = evaluarFuncion(padre,nFuncion);
    
    allFitness = [];
    varianza = sigma;
    
    for i=1:gmax
        allFitness = [allFitness; minimoActual]; %Guardamos el fitness del padre
        hijo = generarHijo(padre,varianza); %Geneamos hijo
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
function [hijo] = generarHijo(padre,varianza)
    ruido = 0 + varianza*randn(1,30);
    hijo = padre + ruido;
end

%Generamos resultado de función objetivo del individuo
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