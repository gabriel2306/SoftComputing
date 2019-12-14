function armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres)
    varPredictivas = cell(1,nPadres);
    for i=1:nPadres
        vector = -1 + 2*rand(1,nCaracteristicas*2);
        w0 = -5 + 10*rand;
        varPredictivas{i} = [w0, vector];
    end

    armoniaInicial = varPredictivas;
end

