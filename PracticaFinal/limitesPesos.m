function [minimo,maximo] = limitesPesos(indice)
    %El primer indice siempre será w0
    if (indice==1)
       maximo = 5;
       minimo = -5;
    else
       maximo = 1;
       minimo = -1;
    end
end

