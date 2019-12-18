function armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres, linealizar)
    varPredictivas = cell(1,nPadres);
    for i=1:nPadres
        vector = -1 + 2*rand(1,nCaracteristicas*2);
        
        % Los exponentes del modelo se ponene a 1
        if linealizar
           vector = linealizarPesos(vector,nCaracteristicas); 
        end
        
        w0 = -5 + 10*rand;
        varPredictivas{i} = [w0, vector];
    end

    armoniaInicial = varPredictivas;
end

