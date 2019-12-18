function valor = comprobarValor(valorInicial, minimo, maximo)
    if(valorInicial<minimo)
        valor = minimo;
    else 
        if(valorInicial>maximo)
            valor = maximo;
        end
    end
end

