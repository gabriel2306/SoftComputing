function [minimo] = funcion2(vector)
    minimo = sum(vector.*(-sin(sqrt(abs(vector)))));
end
