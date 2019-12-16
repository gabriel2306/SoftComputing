function error = funcionMinimizar(enReal, enCalculada)
    suma = 0;
    tam = length(enReal);
    for i=1:tam
        suma = suma + (enReal(i) - enCalculada(i))^2;
    end
    
    error = suma/tam;
end