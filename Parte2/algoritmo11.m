function [soluciones,mejor] = algoritmo11(vector,gmax)
    minimoActual = funcion1(vector);
    padre = vector;
    mejor = minimoActual;
    soluciones = [];
    hijo = [];
    varianza = 0.5;
    
    for i=1:gmax
        soluciones = [soluciones; minimoActual];
        hijo = generarHijo(padre,varianza);
        minimoHijo = funcion1(hijo);
        
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