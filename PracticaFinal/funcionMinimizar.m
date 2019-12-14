function error = funcionMinimizar(enReal, enCalculada)
    suma = 0;
    tam = length(enReal);
    for i=tam
        suma = suma + (enReal(i) - enCalculada(i))^2;
    end
    
    error = suma/tam;
end