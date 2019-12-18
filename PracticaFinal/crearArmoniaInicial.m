function armoniaInicial = crearArmoniaInicial(nCaracteristicas, nPadres)
    varPredictivas = cell(1,nPadres);
    for i=1:nPadres
        vector = -1 + 2*rand(1,nCaracteristicas*2);
        for j=7:12
            vector(j) = 1;
        end
        w0 = -5 + 10*rand;
        varPredictivas{i} = [w0, vector];
    end

    armoniaInicial = varPredictivas;
end

