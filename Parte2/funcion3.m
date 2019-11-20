function [minimo] = funcion3(vector)
    suma = 0;
    tam = size(vector);
    for i=1:(tam(2)-1)
        actual = vector(i);
        suma = suma + (100*(vector(i+1)-actual^2)^2) + (1 - actual)^2;
    end
    minimo = suma;
end