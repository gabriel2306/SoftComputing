function pesosLinealizados = linealizarPesos(pesos,nCaracteristicas)
    longitudPesos = length(pesos);
    
    if (mod(length(pesos),2) == 0)
        suma = 0;
    else
        suma = 1;
    end
    
    %La bia y los pesos se deben conservar
    indicePrimerExponente = (longitudPesos/2)+suma;
    rangoAConservar = 1:indicePrimerExponente;
    
    pesosLinealizados = [pesos(rangoAConservar), ones(1,nCaracteristicas)];
end

