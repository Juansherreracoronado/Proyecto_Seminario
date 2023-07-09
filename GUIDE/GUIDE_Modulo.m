function varargout = GUIDE_Modulo(varargin)
% GUIDE_MODULO MATLAB code for GUIDE_Modulo.fig
%      GUIDE_MODULO, by itself, creates a new GUIDE_MODULO or raises the existing
%      singleton*.
%
%      H = GUIDE_MODULO returns the handle to a new GUIDE_MODULO or the handle to
%      the existing singleton*.
%
%    GUIDE_MODULO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE_MODULO.M with the given input arguments.
%
%      GUIDE_MODULO('Property','Value',...) creates a new GUIDE_MODULO or raises th
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDE_Modulo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDE_Modulo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDE_Modulo

% Last Modified by GUIDE v2.5 04-Jul-2023 19:55:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUIDE_Modulo_OpeningFcn, ...
    'gui_OutputFcn',  @GUIDE_Modulo_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIDE_Modulo is made visible.
function GUIDE_Modulo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIDE_Modulo (see VARARGIN)

% Choose default command line output for GUIDE_Modulo
handles.a=arduino;
%handles.a=arduino % Conecta a arduino y guarda la información en un handles
handles.servo=servo(handles.a,'D9'); %Servo 1
handles.servo2=servo(handles.a,'D8'); %Servo 2
writePosition(handles.servo,0);
writePosition(handles.servo2,0);
set(handles.movimiento_S1,'Min',0,'Max',1,'value',0,'SliderStep',[0.1 0.1]);
set(handles.movimiento_S2,'Min',0,'Max',1,'value',0,'SliderStep',[0.1 0.1]);
global c;
c=1;
handles.output=hObject;
guidata(hObject, handles);

% UIWAIT makes GUIDE_Modulo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIDE_Modulo_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on slider movement.
function movimiento_S1_Callback(hObject, eventdata, handles)
% hObject    handle to movimiento_S1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Servo1 = get(hObject,'Value')
writePosition(handles.servo,Servo1);


% --- Executes during object creation, after setting all properties.
function movimiento_S1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to movimiento_S1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function movimiento_S2_Callback(hObject, eventdata, handles)
% hObject    handle to movimiento_S2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Servo2 = get(hObject,'Value')
writePosition(handles.servo2,Servo2);


% --- Executes during object creation, after setting all properties.
function movimiento_S2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to movimiento_S2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Mover_Cinematica.
function Mover_Cinematica_Callback(hObject, eventdata, handles)
% hObject    handle to Mover_Cinematica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Datos2R.mat
% AQUI VAN LOS DATOS DE SUUUUUU RED
load RedRobot.mat
Px_String=evalin('base','Px_String');
Py_String=evalin('base','Py_String');
if Px_String > -21.4 && Px_String < 21.4 && Py_String > -9.7 && Px_String < 21.4
[Px1,Py1] = MoveL_2R([Px_String, Px_String],[Py_String, Py_String],1)
Rta=sim(Red,[Px1;Py1]);
degrees = rad2deg(Rta);
position = (degrees - 0) / (180 - 0)
writePosition(handles.servo,position(1,1));
writePosition(handles.servo2,position(2,1));
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
Px_String=str2double(get(hObject,'String'));
assignin('base','Px_String',Px_String);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Py_String=str2double(get(hObject,'String'));
assignin('base','Py_String',Py_String);
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Comando_Control_Voz.
function Comando_Control_Voz_Callback(hObject, eventdata, handles)
% hObject    handle to Comando_Control_Voz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load RedAudio.mat
recObj = audiorecorder(8000,16,1,0);
set(handles.Comando_Control_Voz,'string','Inicializando Micro');
disp('Inicializando Micro');
recordblocking(recObj,2);
n=1;

for k=1:1:n
    set(handles.Comando_Control_Voz,'string','Presione ENTER para grabar');
    %   b=input('Presione ENTER para grabar');
    disp('Hable!!!!');
    set(handles.Comando_Control_Voz,'string','Hable');
    recordblocking(recObj,3);
    disp('Silencio!!!!');
    set(handles.Comando_Control_Voz,'string','Silencio');
    y = getaudiodata(recObj);
    MF=mfcc(y,8000);
    RtaVoz=sim(RedVoz,MF(:))
    for i = 1:length(RtaVoz)
        if RtaVoz(i) >= 0.75 && RtaVoz(i) <= 1
            switch i
                case 1
                    set(handles.Comando_Control_Voz,'string','Comando 1');
                    writePosition(handles.servo,0.1576);
                    writePosition(handles.servo2,0.5399);
                case 2
                    set(handles.Comando_Control_Voz,'string','Comando 2');
                    writePosition(handles.servo,0.4625);
                    writePosition(handles.servo2,0.4036);
                case 3
                    set(handles.Comando_Control_Voz,'string','Comando 3');
                    writePosition(handles.servo,0.3227);
                    writePosition(handles.servo2,0.6396);
                case 4
                    set(handles.Comando_Control_Voz,'string','Comando 4');
                    writePosition(handles.servo,0.3174);
                    writePosition(handles.servo2,0.5397);
            end
        end
    end
    pause(3);
    set(handles.Comando_Control_Voz,'string','Comando');
end


% --- Executes on button press in Boton_Logo1.
function Boton_Logo1_Callback(hObject, eventdata, handles)
% hObject    handle to Boton_Logo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load Datos2R.mat
% AQUI VAN LOS DATOS DE SUUUUUU RED
load RedRobot.mat

% EMPEZAMOS A PINTAR

% NO OLVIDE CAMBIAR LOS PUNTOS USADOS COMO EJEMPLO

% Primera Linea
[VecX1,VecY1] = MoveL_2R([4.446 13.510],[1.878 13.066],5);
Rta1=sim(Red,[VecX1;VecY1]);
for v=1:1:5
    MTH=Bobot.fkine(Rta1(:,v)');
    Rx1(v)=MTH(1,4);
    Ry1(v)=MTH(2,4);
end
degrees = rad2deg(Rta1);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    %pause(0.5);
    writePosition(handles.servo2,position(2,v));
    %pause(0.5);
end
plot(VecX1,VecY1,'ro');
grid on
xlabel('Eje X')
ylabel('Eje Y')
hold on
plot(Rx1,Ry1,'k*');
legend('Original','2R Copion')

% Segunda Linea
[VecX2,VecY2] = MoveL_2R([1.878 13.066],[-2.579 16.753],5);
Rta2=sim(Red,[VecX2;VecY2]);
for v=1:1:5
    MTH=Bobot.fkine(Rta2(:,v)');
    Rx2(v)=MTH(1,4);
    Ry2(v)=MTH(2,4);
end
degrees = rad2deg(Rta2);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    %pause(0.5);
    writePosition(handles.servo2,position(2,v));
    %pause(0.5);
end
plot(VecX2,VecY2,'ro');
plot(Rx2,Ry2,'k*');

% tercera Linea
[VecX3,VecY3] = MoveL_2R([-2.579 16.753],[-1.643 19.313],5);
Rta3=sim(Red,[VecX3;VecY3]);
for v=1:1:5
    MTH=Bobot.fkine(Rta3(:,v)');
    Rx3(v)=MTH(1,4);
    Ry3(v)=MTH(2,4);
end
degrees = rad2deg(Rta3);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    %pause(0.5);
    writePosition(handles.servo2,position(2,v));
    %pause(0.5);
end
plot(VecX3,VecY3,'ro');
plot(Rx3,Ry3,'k*');

% cuarta Linea
[VecX4,VecY4] = MoveL_2R([-1.643 19.313],[0.001 17.351],5);
Rta4=sim(Red,[VecX4;VecY4]);
for v=1:1:5
    MTH=Bobot.fkine(Rta4(:,v)');
    Rx4(v)=MTH(1,4);
    Ry4(v)=MTH(2,4);
end
degrees = rad2deg(Rta4);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX4,VecY4,'ro');
plot(Rx4,Ry4,'k*');

% Quinta Linea
[VecX5,VecY5] = MoveL_2R([0.001 17.351],[-2.460 12.429],5);
Rta5=sim(Red,[VecX5;VecY5]);
for v=1:1:5
    MTH=Bobot.fkine(Rta5(:,v)');
    Rx5(v)=MTH(1,4);
    Ry5(v)=MTH(2,4);
end
degrees = rad2deg(Rta5);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX5,VecY5,'ro');
plot(Rx5,Ry5,'k*');

% Sexta Linea
[VecX6,VecY6] = MoveL_2R([-2.460 12.429],[-4.649 12.355],5);
Rta6=sim(Red,[VecX6;VecY6]);
for v=1:1:5
    MTH=Bobot.fkine(Rta6(:,v)');
    Rx6(v)=MTH(1,4);
    Ry6(v)=MTH(2,4);
end
degrees = rad2deg(Rta6);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX6,VecY6,'ro');
plot(Rx6,Ry6,'k*');

% Septima Linea
[VecX7,VecY7] = MoveL_2R([-4.649 12.355],[-2.962 14.9],5);
Rta7=sim(Red,[VecX7;VecY7]);
for v=1:1:5
    MTH=Bobot.fkine(Rta7(:,v)');
    Rx7(v)=MTH(1,4);
    Ry7(v)=MTH(2,4);
end
degrees = rad2deg(Rta7);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX7,VecY7,'ro');
plot(Rx7,Ry7,'k*');

% octava Linea
[VecX8,VecY8] = MoveL_2R([-2.962 14.9],[1.271 15.603],5);
Rta8=sim(Red,[VecX8;VecY8]);
for v=1:1:5
    MTH=Bobot.fkine(Rta8(:,v)');
    Rx8(v)=MTH(1,4);
    Ry8(v)=MTH(2,4);
end
degrees = rad2deg(Rta8);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX8,VecY8,'ro');
plot(Rx8,Ry8,'k*');

% novena Linea
[VecX9,VecY9] = MoveL_2R([1.271 15.603],[4.446 13.510],5);
Rta9=sim(Red,[VecX9;VecY9]);
for v=1:1:5
    MTH=Bobot.fkine(Rta9(:,v)');
    Rx9(v)=MTH(1,4);
    Ry9(v)=MTH(2,4);
end
degrees = rad2deg(Rta9);
position = (degrees - 0) / (180 - 0);
for v=1:1:5
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX9,VecY9,'ro');
plot(Rx9,Ry9,'k*');


% --- Executes on button press in Boton_Logo2.
function Boton_Logo2_Callback(hObject, eventdata, handles)
% hObject    handle to Boton_Logo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load Datos2R.mat
% AQUI VAN LOS DATOS DE SUUUUUU RED
load RedRobot.mat

% EMPEZAMOS A PINTAR

% NO OLVIDE CAMBIAR LOS PUNTOS USADOS COMO EJEMPLO

% Primera Linea
[VecX1,VecY1] = MoveL_2R([1.567 11.469],[-3.465 11.045],4);
Rta1=sim(Red,[VecX1;VecY1]);
for v=1:1:4
MTH=Bobot.fkine(Rta1(:,v)');
Rx1(v)=MTH(1,4);
Ry1(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta1);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX1,VecY1,'ro');
grid on
xlabel('Eje X')
ylabel('Eje Y')
hold on
plot(Rx1,Ry1,'k*');
legend('Original','2R Copion')

% Segunda Linea
[VecX2,VecY2] = MoveL_2R([-3.465 11.045],[-3.465 8.595],3);
Rta2=sim(Red,[VecX2;VecY2]);
for v=1:1:3
MTH=Bobot.fkine(Rta2(:,v)');
Rx2(v)=MTH(1,4);
Ry2(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta2);
position = (degrees - 0) / (180 - 0);
for v=1:1:3
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX2,VecY2,'ro');
plot(Rx2,Ry2,'k*');

% tercera Linea
[VecX3,VecY3] = MoveL_2R([-3.465 8.595],[-7.630 7.940],4);
Rta3=sim(Red,[VecX3;VecY3]);
for v=1:1:4
MTH=Bobot.fkine(Rta3(:,v)');
Rx3(v)=MTH(1,4);
Ry3(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta3);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX3,VecY3,'ro');
plot(Rx3,Ry3,'k*');

% cuarta Linea
[VecX4,VecY4] = MoveL_2R([-7.630 7.940],[-7.518 10.199],3);
Rta4=sim(Red,[VecX4;VecY4]);
for v=1:1:3
MTH=Bobot.fkine(Rta4(:,v)');
Rx4(v)=MTH(1,4);
Ry4(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta4);
position = (degrees - 0) / (180 - 0);
for v=1:1:3
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX4,VecY4,'ro');
plot(Rx4,Ry4,'k*');

% Quinta Linea
[VecX5,VecY5] = MoveL_2R([-7.518 10.199],[-13.195 9.229],4);
Rta5=sim(Red,[VecX5;VecY5]);
for v=1:1:4
MTH=Bobot.fkine(Rta5(:,v)');
Rx5(v)=MTH(1,4);
Ry5(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta5);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX5,VecY5,'ro');
plot(Rx5,Ry5,'k*');

% Sexta Linea
[VecX6,VecY6] = MoveL_2R([-13.195 9.229],[-11.934 12.038],3);
Rta6=sim(Red,[VecX6;VecY6]);
for v=1:1:3
MTH=Bobot.fkine(Rta6(:,v)');
Rx6(v)=MTH(1,4);
Ry6(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta6);
position = (degrees - 0) / (180 - 0);
for v=1:1:3
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX6,VecY6,'ro');
plot(Rx6,Ry6,'k*');

% Septima Linea
[VecX7,VecY7] = MoveL_2R([-11.934 12.038],[-7.422 13.255],4);
Rta7=sim(Red,[VecX7;VecY7]);
for v=1:1:4
MTH=Bobot.fkine(Rta7(:,v)');
Rx7(v)=MTH(1,4);
Ry7(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta7);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX7,VecY7,'ro');
plot(Rx7,Ry7,'k*');

% octava Linea
[VecX8,VecY8] = MoveL_2R([-7.422 13.255],[-7.386 15.7],4);
Rta8=sim(Red,[VecX8;VecY8]);
for v=1:1:4
MTH=Bobot.fkine(Rta8(:,v)');
Rx8(v)=MTH(1,4);
Ry8(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta8);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX8,VecY8,'ro');
plot(Rx8,Ry8,'k*');

% novena Linea
[VecX9,VecY9] = MoveL_2R([-7.386 15.7],[-2.305 15.936],4);
Rta9=sim(Red,[VecX9;VecY9]);
for v=1:1:4
MTH=Bobot.fkine(Rta9(:,v)');
Rx9(v)=MTH(1,4);
Ry9(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta9);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX9,VecY9,'ro');
plot(Rx9,Ry9,'k*');

% decima Linea
[VecX10,VecY10] = MoveL_2R([-2.305 15.936],[-2.612 13.981],3);
Rta10=sim(Red,[VecX10;VecY10]);
for v=1:1:3
MTH=Bobot.fkine(Rta10(:,v)');
Rx10(v)=MTH(1,4);
Ry10(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta10);
position = (degrees - 0) / (180 - 0);
for v=1:1:3
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX10,VecY10,'ro');
plot(Rx10,Ry10,'k*');

% once Linea
[VecX11,VecY11] = MoveL_2R([-2.612 13.981],[3.664 14.743],4);
Rta11=sim(Red,[VecX11;VecY11]);
for v=1:1:4
MTH=Bobot.fkine(Rta11(:,v)');
Rx11(v)=MTH(1,4);
Ry11(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta11);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX11,VecY11,'ro');
plot(Rx11,Ry11,'k*');

% doce Linea
[VecX12,VecY12] = MoveL_2R([3.664 14.743],[1.567 11.469],4);
Rta12=sim(Red,[VecX12;VecY12]);
for v=1:1:4
MTH=Bobot.fkine(Rta12(:,v)');
Rx12(v)=MTH(1,4);
Ry12(v)=MTH(2,4);    
end 
degrees = rad2deg(Rta12);
position = (degrees - 0) / (180 - 0);
for v=1:1:4
    writePosition(handles.servo,position(1,v));
    pause(0.5);
    writePosition(handles.servo2,position(2,v));
    pause(0.5);
end
plot(VecX12,VecY12,'ro');
plot(Rx12,Ry12,'k*');


% % --- Executes on button press in Conectar_Arduino.
% function Conectar_Arduino_Callback(hObject, eventdata, handles)
% % hObject    handle to Conectar_Arduino (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%     handles.a=arduino;
%     handles.servo=servo(handles.a,'D9'); %Servo 1
%     handles.servo2=servo(handles.a,'D8'); %Servo 2
%     writePosition(handles.servo,0);
%     writePosition(handles.servo2,0);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
global cam;
writePosition(handles.servo,0);
writePosition(handles.servo2,0);
clear handles.a % Cierra y termina la conexión con arduino
clear cam;
delete(hObject);
clear;
clc;



% --- Executes on button press in Capturar_Imagen.
function Capturar_Imagen_Callback(hObject, eventdata, handles)
% hObject    handle to Capturar_Imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Red1.mat
global cam;
global a;
global Respuesta;
global p;
p=0;
d=0;
while d<1
    img=snapshot(cam);
    [a,b]=maskprueba(img);
    a=bwareaopen(a,10000);
    Respuesta=sim(Red_Gestos,a(:))
    for i = 1:length(Respuesta)
        if Respuesta(i) >= 0.85 && Respuesta(i) <= 1
            switch i
                case 1
                    disp('gesto 1')
                    set(handles.Boton_Control_Imagen,'string','Gesto 1');
               
                case 2
                    disp('gesto 2')
                    position1 = readPosition(handles.servo)
                    set(handles.Boton_Control_Imagen,'string','Gesto 2');
                    
                case 3
                    disp('gesto 3')
                    position2 = readPosition(handles.servo2)
                    set(handles.Boton_Control_Imagen,'string','Gesto 3');
                    
                case 4
                    disp('gesto 4')
                    position2 = readPosition(handles.servo2)
                    set(handles.Boton_Control_Imagen,'string','Gesto 4');
                    
            end
        end
    end
    d=d+1;
    imshow(a);
end

% --- Executes on button press in Boton_Control_Imagen.
function Boton_Control_Imagen_Callback(hObject, eventdata, handles)
% hObject    handle to Boton_Control_Imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load Red1.mat
global c;
global cam;
global a;
global p;
p = 1;
c=c+1
if mod(c, 2) == 0
   cam=webcam();
   cam.Resolution='640x480';
   axes(handles.axes_Control_Imagen);
   preview(cam)
   
else
    clear cam
    set(handles.Boton_Control_Imagen,'string','Comando');
end


% --- Executes on button press in Mover_Servo.
function Mover_Servo_Callback(hObject, eventdata, handles)
% hObject    handle to Mover_Servo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Respuesta;
global p; 
p=0;
for i = 1:length(Respuesta)
        if Respuesta(i) >= 0.85 && Respuesta(i) <= 1
            switch i
                case 1
                    disp('gesto 1')
                    set(handles.Boton_Control_Imagen,'string','Gesto 1');
                    position1 = readPosition(handles.servo)
                    if readPosition(handles.servo) <= 0.9 && readPosition(handles.servo) >= 0
                        writePosition(handles.servo,(readPosition(handles.servo))+0.1)
                    end
                case 2
                    disp('gesto 2')
                    position1 = readPosition(handles.servo)
                    set(handles.Boton_Control_Imagen,'string','Gesto 2');
                    if readPosition(handles.servo) >= 0.1 && readPosition(handles.servo) <= 1
                        writePosition(handles.servo,(readPosition(handles.servo))-0.1)
                    end
                case 3
                    disp('gesto 3')
                    position2 = readPosition(handles.servo2)
                    set(handles.Boton_Control_Imagen,'string','Gesto 3');
                    if readPosition(handles.servo2) <= 0.9 && readPosition(handles.servo2) >= 0
                        writePosition(handles.servo2,(readPosition(handles.servo2))+0.1)
                    end
                case 4
                    disp('gesto 4')
                    position2 = readPosition(handles.servo2)
                    set(handles.Boton_Control_Imagen,'string','Gesto 4');
                    if readPosition(handles.servo2) >= 0.1 && readPosition(handles.servo2) <= 1
                        writePosition(handles.servo2,(readPosition(handles.servo2))-0.1)
                    end
            end
        end
end

