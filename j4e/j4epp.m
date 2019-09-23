% Los programas en MATLAB se guardan con extensi�n *.m
% y para ejecutarlos basta con llamar desde la 
% l�nea de comandos al nombre sin la extensi�n *.m
% en este caso >>j4e

% Se utilizar� el flag 
% LIMPIAR para introducir c�digo de 
% aclaraci�n que puede ser eliminado 
% en la aplicaci�n de 4 en Raya
%LIMPIAR=1 para las sesiones de aprendizaje 
%LIMPIAR=0 para ejecutar normalmente
LIMPIAR=0;
% Puede observarse que no es necesario declaraci�n alguna
% previa a la utilizaci�n de la variable.
% Tras el aprendizaje eliminar las l�neas de 
% c�digo en los if correspondientes con LIMPIAR==1.



% MATLAB es un lenguaje interpretado, por tanto
% l�nea a l�nea se interpreta y ejecuta.
% Los errores aparecer�n al ejecutar la l�nea que
% contiene el error.
% El car�cter que indica un comentario a partir 
% del mismo es '%', que puede estar al principio 
% de la l�nea o en cualquier posici�n de la misma.
% Algunos editores espec�ficos tienen la opci�n
% de seleccionar un trozo de c�digo y comentar
% todas las l�neas a la vez y quitar esos
% comentarios.
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Antes de comenzar a desarrollar cualquier 
% programa es importante saber lo que se desea
% programar.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% OBJETIVO:
% Programar una aplicaci�n en MATLAB del juego 4 en raya
% contra el ordenador (que jugar� con la funci�n 
% make_move que no es necesario editar ni revisar).
% 
% PASO 1: 
% Representaci�n del tablero: representar una zona 
% uniforme con los huecos donde se colocan las fichas.
% 
% Vamos a utilizar dos variables para indicar el
% n�mero de columnas N y filas M (la funci�n de
% juego autom�tico est� desarrollada s�lo para 7 x 7).
% 
% En MATLAB no se necesitan declarar las variables 
% previamente, en este caso dado que vamos a utilizar 
% unas variables como globales para las funciones, debemos
% indicarlo mediante la declaraci�n global.
% Escriba 
global N M NIVEL
NIVEL=30
N=7;
M=7; 

% La funci�n make_move (s�lo funciona para tablero de 7x7)
% para asignar los n�meros de columnas y filas
% respectivamente de nuestro tablero de juego.
% 
% vuelva escibir N para comprobar su valor
% Escriba
%Observe que la condici�n if debe cerrarse con end.
if (LIMPIAR==1)
    %Observe que la condici�n if debe cerrarse con end.
    % La asignaci�n se realiza con un '=' y 
    % la comparaci�n con dos '=='
    N
    % La funci�n pause detiene la ejecuci�n hasta pulsar una tecla. Si la
    % funci�n se llama con un valor num�rico espera esos segundos para
    % continuar con la ejecuci�n.
    pause;
end

% Para ejecutar en modo depuraci�n puede realizarlo desde el mismo editor.
% En la parte superior puede encontrar:
% - Bot�n para ejecutar.
% - Bot�n para introducir breakpoints
% - Bot�n para eliminar breakpoints
% - Una vez que se est� ejecutando puede:
%     x Ejecutar paso a paso
%     x Ejecutar entrando en las funciones
%     x Ejecutar hasta el nuevo breakpoints.

if (LIMPIAR==1)
    % Una asignaci�n sin incluir el ; al final de la
    % l�nea indica por pantalla el resultado y no lo hace al incluir ';'
    % En las funciones que suponen una representaci�n cualquiera de las dos
    % opciones es v�lida.
    N=7;
end


% El interfaz gr�fico de MATLAB resulta muy �til.
% Con la siguiente instrucci�n se crea la figura 1
figure(1);
% Inicialmente estar� vac�a.

% El comando plot permite representar figuras
% con diferentes opciones de las que s�lo veremos algunos
% casos. Por ejemplo: 
if (LIMPIAR==1)
  % La representaci�n de una serie de 
  % puntos: [1 1] [2 2] [3 3] [4 0]
  % con cruces 'r' rojas en dichos puntos
  plot([1 2 3 4 ],[1 2 3 0],'rx');
  pause;
  % Unir esos puntos por una l�nea de grosor 3 y 'b' azul. 
  plot([1 2 3 4 ],[1 2 3 0],'b','LineWidth',3);
  pause;
  % Para revisar la descripci�n de cualquier funci�n
  % de MATLAB puede utilizarse 
  % 'help' (con la funci�n que se desea comprobar)
  help plot 
end

% Esta funci�n permite borrar una figura
clf;
% Esta funci�n permite borrar la pantalla de comandos
clc;

if (LIMPIAR==1)
  %     MATLAB funciona fundamentalmente con Matrices o 
  %     vectores en caso de una �nica fila o columna.
  % Un vector se puede definir manualmente escribiendo
%   los valores que forman el vector entre corchetes
%   separando por comas o espacios los elementos de cada columna
%   y por ';' las diferentes filas.
  n=[ 1 2 3 4]
  nn=[1,2,3,4]
  nnn=[1,2,3,4;1 2 3 4;1 2, 3 4]
  % Para crear un vector se puede utilizar ':', que crea un 
  % vector desde el n�mero inicial hasta el �ltimo
  % de uno en uno si no se indica otra cosa.
  
  n=0:N+1;
  pause;
  %observe la diferencia con:
  n=0:0.5:N+1
  
  % Puede realizar incrementos o decrementar
  n=4:-0.5:0
  %  Observe que los �ndices en MATLAB comienzan en 
  %  1 y se accede a los elementos con par�ntesis
  %  n(1)
  n(1)
  pause;
  n(2)
  pause;
  n(3)
  pause;
end;


% Para crear el tablero se realiza la representaci�n
% de una zona azul plana desde 0 a N+1 (el n�mero
% de columnas m�s uno)

n=0:N+1;
close('all');
figure('Color',[0 0 1]);

% Para representar el tablero azul uniforme
% se representan una serie de l�neas paralelas
% Observe la funci�n zeros que permite carear
% una matriz de ceros de las dimensiones indicadas
% Tambi�n se puede utilizar la funci�n ones: para
% crear una matriz de unos o eye para crear una 
% matriz identidad, 

% Observe que el bucle 'for' debe cerrarse con end
% que se ejecutar� para cada uno de los valores del
%vector que se utiliza en el mismo.
for m=0:0.1:M+1
  plot(n,zeros(1,length(n))+m,'b','LineWidth',13);
  % Los ejes de las representaciones se asignan
  % autom�ticamente, si desea unos ejes fijos
  % debe utilizarse la funci�n axis con los m�ximos
  % y m�nimos de cada eje.
  axis([0 N+1 0 M+1]);
  % Activamos la funci�n de sobreimpresi�n y todo lo que se escriba hasta
  % volver a deshabilitarla se representar� sobre la misma figura.
  hold on
  if (LIMPIAR==1)
    pause; 
  end
end

% Para no visualizar los ejes
axis('off');
if (LIMPIAR==1)
  pause;
end

% Para poner el fondo de la figura blanco
%savtoner('save');
if (LIMPIAR==1)
  % Representamos los huecos en blanco
  for n=1:N
    for m=1:M
        plot(n,m,'ow','LineWidth',25);
        pause;
    end
  end
end

% Una soluci�n alternativa es tener una matriz con los puntos y
% representarlos todos de una vez. Para ello, mediante la multiplicaci�n
% de matrices (vectores) construimos una matriz que volvemos
% a convertir en vector y representamos todos los puntos de una s�la vez.
% Compruebe eliminando el ; final la salida de cada una de estas 
% operaciones.
if (LIMPIAR==1)
    (1:N)
    (1:N)'
    ones(1,M)
    ones(1,M)'
    pause
end
%Matriz de M columnas de 1 a N
puntosx=((1:N)'*(ones(1,M)))';
% Conversi�n en una �nica columna concatenando las colummnas de partida
puntosx=puntosx(:);
% Obtenemos la transpuesta del vector, pasando de vector columna a vector
% fila
puntosx=puntosx';

% De forma similar para obtener las otras coordenadas
puntosy=((1:N)'*(ones(1,M)));
puntosy=puntosy(:);
puntosy=puntosy';
plot(puntosx,puntosy,'ow','LineWidth',25);

% PASO 2: Bucle de secuencia de jugadas


% % Para indicar la jugada existente se va 
% a utilizar una MATRIZ con tantas celdas 
% como posiciones en el tablero. 
% Un cero en la matriz indica que no se ha
% jugado sobre esa posici�n, '1' indica que
% uno de los jugadores ha puesto una pieza
% y '-1' indica que el otro jugador ha 
% puesto una pieza.

% Iniciamos la MATRIZ utilizando la funci�n
% de MATLAB zeros.
global MATRIZ % definimos esta variable como global 
% para las funciones que la necesiten, dado que las funciones
% no tienen acceso a las variables externas a la misma, excepto
% que se indiquen mediante 'global' que es una variable global
MATRIZ=zeros(N,M);




% Utilizamos la funci�n ginput para recoger 
% la posici�n de la pulsaci�n del rat�n
% el par�metro de la funci�n indica cuantas pulsaciones debemos realizar
% antes de devolver el control con los datos de cada pulsaci�n.

[x,y,b]=ginput(1);
        
% Si se pulsa ESCAPE se acaba
% 'while' permite realizar un bucle mientras no se haya pulsado 
% la tecla ESCAPE, es necesario tener en cuenta que se puede salir
% de un bucle while o for mediante la funci�n 'break'

while b~=27  % 27 corresponde con el valor devuelto al pulsar ESCAPE          
  % Si ha pulsado bot�n izquierdo del rat�n
  
  if (b==1)
      % Aseguramos que se opta por una columna 
      %  entre 1 y N.
      indice=round(x);
      % Los �ndices de las matrices comienzan en
      % 1 y deben ser n�meros enteros y si est� fuera de los l�mites 
      % asignamos el l�mite m�s cercano.
      if indice<1
        indice=1;
      end
      if indice>N
        indice=N;
      end
      % Si esa columna est� completa producimos un 
      % pitido para indicar que no es posible colocar
      % en esa posici�n.
      % Tenga en cuenta la forma de expresar 'diferente de ' que
      % se realiza mediante el caracter '~'
      if (MATRIZ(indice,M)~=0)
          beep;
      else
          % La condici�n se puede completar con 'else'
          % y el conjunto if-else debe acabar con end.
          
          % Recorremos la columna elegida desde la
          % primera fila hasta encontrar el primer hueco
          % para colocar la pieza que nos indican.
          for m=1:M
            if (MATRIZ(indice,m)==0)
              plot(indice,m,'og','LineWidth',25);
                
              pause(0.1);
              MATRIZ(indice,m)=-1;
              % Una vez que se ha encontrado el hueco
              % la funci�n break nos permite salir 
              % del bucle for, mediante la funci�n 'break'.
              break;
            end
          end
        % Comprobamos si con esa juegada se ha ganado la partida.
        % Para llamar a una funci�n escrita por nosotros en un fichero
%         *.m se hace igual que si fuera una funci�n de MATLAB.
%         escribiendo su nombre, pasando los par�metros necesarios e 
%         igualando a los par�metros que devuelve esta funci�n.
%         Esta funci�n estar� descrita en un fichero con su mismo nombre y 
%         extensi�n .m
        ganador=comprueba(MATRIZ);
        %  Si no se ha ganado y hay m�s huecos el jugador autom�tico debe
        %  realizar el siguiente movimiento que se realiza mediante la
        %  llamada a otra funci�n indicando el tablero actual. 
      end
  end
            
  if (ganador~=0)
            % Si se ha ganado alguno se sale
     break;
  end
  
  [x,y,b]=ginput(1);
  if (b==1)
      % Aseguramos que se opta por una columna 
      %  entre 1 y N.
      indice=round(x);
      % Los �ndices de las matrices comienzan en
      % 1 y deben ser n�meros enteros y si est� fuera de los l�mites 
      % asignamos el l�mite m�s cercano.
      if indice<1
        indice=1;
      end
      if indice>N
        indice=N;
      end
      % Si esa columna est� completa producimos un 
      % pitido para indicar que no es posible colocar
      % en esa posici�n.
      % Tenga en cuenta la forma de expresar 'diferente de ' que
      % se realiza mediante el caracter '~'
      if (MATRIZ(indice,M)~=0)
          beep;
      else
          % La condici�n se puede completar con 'else'
          % y el conjunto if-else debe acabar con end.
          
          % Recorremos la columna elegida desde la
          % primera fila hasta encontrar el primer hueco
          % para colocar la pieza que nos indican.
          for m=1:M
            if (MATRIZ(indice,m)==0)
              plot(indice,m,'or','LineWidth',25);
                
              pause(0.1);
              MATRIZ(indice,m)=1;
              % Una vez que se ha encontrado el hueco
              % la funci�n break nos permite salir 
              % del bucle for, mediante la funci�n 'break'.
              break;
            end
          end
        % Comprobamos si con esa juegada se ha ganado la partida.
        % Para llamar a una funci�n escrita por nosotros en un fichero
%         *.m se hace igual que si fuera una funci�n de MATLAB.
%         escribiendo su nombre, pasando los par�metros necesarios e 
%         igualando a los par�metros que devuelve esta funci�n.
%         Esta funci�n estar� descrita en un fichero con su mismo nombre y 
%         extensi�n .m
        ganador=comprueba(MATRIZ);
        %  Si no se ha ganado y hay m�s huecos el jugador autom�tico debe
        %  realizar el siguiente movimiento que se realiza mediante la
        %  llamada a otra funci�n indicando el tablero actual. 
      end
  end
  % Se comprueba si hay piezas por colocar
  % isempty: funci�n de MATLAB que indica si una matriz o vector est�
  % vac�a.
  % find: devuelve los elementos de la MATRIZ que cumplen la condici�n
  % indicada.
  % : indican en una matriz que se consideran todos los elementos de esa
  % dimanesi�n de la matriz, en este caso todas las filas.
  if (isempty(find(MATRIZ(:,M)==0))) 
      % Permite visualizar un mensaje por la pantalla
      disp('EMPATE');
      break;
  else
      % Si quedan piezas por poner y no ha ganado ninguno, vuelve a jugar
      % el primer jugador
      [x,y,b]=ginput(1);
      
  end
end
hold off
pause;
close('all');
%liberamos la figura de la funci�n de sobreimpresi�n

