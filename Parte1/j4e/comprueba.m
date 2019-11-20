% function ganador=comprueba(MATRIZ)
% Esta función llama a la función que comprueba si existe una posición
% ganadora, devuelve el ganador y representa un mensaje indicando el
% ganador caso de que lo haya.

% Para crear una función se escribe 'function' con los parámetros que debe
% devolver (entre corchetes si son varios) = al numbre de la función y
% entre paréntesis los parámetros que se le introducen.

function ganador=comprueba(MATRIZ)
[N,M]=size(MATRIZ);
% Dentro de las funciones también podemos crear nuevas funciones que
% tendrán visibilidad desde la función que las contiene. Puede encontrar
% más abajo el código de la función comp. 
ganador=comp(MATRIZ);

if (ganador~=0)
      if (ganador==1)
          % disp es una función que nos permite representar un texto por
          % pantalla.
        disp('GANADOR ROJO');
        pause;
      else
        disp('GANADOR VERDE');       
      end
      beep;
end



% function ganador=comp(MATRIZ,flag)
% comprueba si hay ganador en la MATRIZ
% con flag 1 representa la jugada ganadora en negro y con flag 0
% no representa.
%
% Para crear una función se escribe 'function' con los parámetros que debe
% devolver (entre corchetes si son varios) = al numbre de la función y
% entre paréntesis los parámetros que se le introducen.
function ganador=comp(MATRIZ)
[N,M]=size(MATRIZ);

ganador=0;

%Horizontales
    for n=1:N-3
          cuenta=sum(MATRIZ(n:n+3,:));
          b=find(abs(cuenta)==4);
          if (length(b)>0)
          
            if (cuenta(b(1))>0)
                ganador=1;
            else
                ganador=-1;
            end
            % Superpone circulos negros para indicar posición ganadora
            plot( n:n+3,[b(1) b(1) b(1) b(1)],'ok','LineWidth',5);
            return;          
          end
    end
 

% Verticales
    for m=1:M-3
          cuenta=sum(MATRIZ(:,m:m+3)');
          b=find(abs(cuenta)==4);
          if (length(b)>0)
          
            if (cuenta(b(1))>0)
                ganador=1;
            else
                ganador=-1;
            end
            % Superpone circulos negros para indicar posición ganadora
            plot([b(1) b(1) b(1) b(1)], m:m+3,'ok','LineWidth',5);
            return;
          end
    end
 

% Pendiente positiva

% Si deseamos separar una línea de código en varias líneas, 
% podemos escribir la línea acabada en ... y seguir en la 
% siguiente línea tantas veces como queramos.
   for m=1:M-3
    for n=1:N-3
          cuenta=MATRIZ(n,m)+...
                 MATRIZ(n+1,m+1)+...
                 MATRIZ(n+2,m+2)+...
                 MATRIZ(n+3,m+3);
          if (abs(cuenta)==4)
            if (cuenta>0)
                ganador=1;
            else
                ganador=-1;
            end
            % Superpone circulos negros para indicar posición ganadora
            plot(n:n+3,m:m+3,'ok','LineWidth',5);
            return;
          end
        end
    end

% Pendiente negativa
  for m=4:M
    for n=1:N-3
          cuenta=MATRIZ(n,m)+...
                 MATRIZ(n+1,m-1)+...
                 MATRIZ(n+2,m-2)+...
                 MATRIZ(n+3,m-3);
          if (abs(cuenta)==4)
              if (cuenta>0)
                ganador=1;
            else
                ganador=-1;
              end
            % Superpone circulos negros para indicar posición ganadora
            plot(n:n+3,m:-1:m-3,'ok','LineWidth',5);
            return;
          end
        end
    end
  
