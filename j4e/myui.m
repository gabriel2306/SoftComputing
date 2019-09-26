function myui
global NIVEL NUMERO_JUGADOR
NIVEL=100;
close('all');
figure('Color',[1 1 1]);

clf;
im=imread('Portada_4er.jpg');
image(im);
axis('off');
%nodither('save');
%savtoner('save');
% Create push button
hlp = uicontrol('Style', 'pushbutton', 'String', 'AYUDA',...
    'Position', [20 350 60 20],...
    'Callback', 'type ayuda.txt');

% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'SALIR',...
    'Position', [20 20 50 20],...
    'Callback', 'beep;close all');

% Create push button
JUGARMP = uicontrol('Style', 'pushbutton', 'String', 'JUGAR MP',...
    'Position', [100 20 70 20],...
    'Callback', 'j4e;');

JUGARPP = uicontrol('Style', 'pushbutton', 'String', 'JUGAR PP',...
    'Position', [200 20 70 20],...
    'Callback', 'j4epp;');

JUGARPM = uicontrol('Style', 'pushbutton', 'String', 'JUGAR PM',...
    'Position', [300 20 70 20],...
    'Callback', 'j4epm;');

% Create slider
txt = uicontrol('Style', 'text','String','NIVEL',...
    'Position', [400 50 120 20]);

sld = uicontrol('Style', 'slider',...
    'Min',1,'Max',6000,'Value',2000,...
    'Position', [400 20 120 20],...
    'Callback', @capt_nivel);

%Create CheckBox
% chb=uicontrol('style','checkbox','units','pixels',...
%                 'position',[170,22,150,20],'String','PRIMER JUGADOR','Callback',@cc)

end

function cc(source,event)
% Es necesario declarar como global cada variable global que se desee
% utilizar en una funci�n.
global NUMERO_JUGADOR
NUMERO_JUGADOR=get(source,'Value');
NUMERO_JUGADOR=NUMERO_JUGADOR+1
end

function capt_nivel(source,event)
global NIVEL
NIVEL = round(get(source,'Value'))
end