function [soluciones,mejor] = algoritmo11(vector,gmax)
    minimoActual = funcion1(vector);
    padre = vector;
    mejor = minimoActual;
    soluciones = [];
    hijo = [];
    for i=1:gmax
        soluciones = [soluciones;minimoActual];
        minimoHijo = funcion1(generarHijo(padre,0.5));
        if(minimoHijo<minimoActual)
            minimoActual = minimoHijo;
            mejor = minimoActual;
            padre = hijo;
        end
    end
end

function [hijo] = generarHijo(padre,varianza)
    hijo = [];
    ruido = 0 + varianza*randn(1,30);
    hijo = padre + ruido;
end