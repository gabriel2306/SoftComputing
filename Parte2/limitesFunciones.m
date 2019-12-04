function [limiteInferior, limiteSuperior] = limitesFunciones(nFuncion)
    % Limites
    if (nFuncion==1)
        limiteInferior = -100;
        limiteSuperior = 100;
    else 
        if (nFuncion==2)
            limiteInferior = -500;
            limiteSuperior = 500;
        else
            if (nFuncion==3)
                limiteInferior = -30;
                limiteSuperior = 30;
            end
        end
    end
end