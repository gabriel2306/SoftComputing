function [soluciones,mejor] = algoritmo11(vector,gmax,nFuncion,sigma)
    padre = vector;
    minimoActual = evaluarFuncion(padre,nFuncion);
    
    mejor = minimoActual;
    soluciones = [];
    varianza = sigma;
    
    for i=1:gmax
        soluciones = [soluciones; minimoActual];
        hijo = generarHijo(padre,varianza);
        minimoHijo = evaluarFuncion(hijo,nFuncion);
        
        if(minimoHijo<minimoActual)
            minimoActual = minimoHijo;
            mejor = minimoActual;
            padre = hijo;
        end
    end
end

function [hijo] = generarHijo(padre,varianza)
    ruido = 0 + varianza*randn(1,30);
    hijo = padre + ruido;
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