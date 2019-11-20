function [hijo] = generarHijo(padre,varianza)
    hijo = [];
    ruido = 0 + varianza*randn(1,30);
    hijo = padre + ruido;
end