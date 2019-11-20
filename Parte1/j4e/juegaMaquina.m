function [matriz] = juegaMaquina(matrizOriginal,M)
    [board,move,v]=make_move(matrizOriginal);
    jr=move(2);
    % Se actualiza la MATRIZ y se representa la pieza
    for m=1:M
        if (matrizOriginal(jr,m)==0)
            plot(jr,m,'og','LineWidth',25);
            matrizOriginal(jr,m)=-1;
            break;
        end
    end
    matriz = matrizOriginal;
end

