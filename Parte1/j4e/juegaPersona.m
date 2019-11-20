function [matriz] = juegaPersona(matrizO, jugador, M, indice)
    
    if (jugador==1)
        color='og';
        ficha=-1;
    else
        color='or';
        ficha=1;
    end

    % Recorremos la columna elegida desde la
    % primera fila hasta encontrar el primer hueco
    % para colocar la pieza que nos indican.
    for m=1:M
        if (matrizO(indice,m)==0)
            plot(indice,m,color,'LineWidth',25);

            pause(0.1);
            matrizO(indice,m)=ficha;
            
            % Una vez que se ha encontrado el hueco
            % la funci�n break nos permite salir
            % del bucle for, mediante la funci�n 'break'.
            break;
        end
    end
    
    matriz=matrizO;

end

