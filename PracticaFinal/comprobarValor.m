function valor = comprobarValor(valorInicial, minimo, maximo)
    if(valorInicial<minimo)
        valor = minimo;
    else 
        if(valorInicial>maximo)
            valor = maximo;
        else 
            valor = valorInicial;
        end    
    end
end

