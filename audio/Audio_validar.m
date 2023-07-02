clear;clc;

load RedAudio.mat
recObj = audiorecorder(8000,16,1,1);
disp('Inicializando Micro');
recordblocking(recObj,2);
n=4;

for k=1:1:n
a=input('Presione ENTER para grabar');
disp('Hable!!!!');
recordblocking(recObj,3);
disp('Silencio!!!!');
y = getaudiodata(recObj);
MF=mfcc(y,8000);
RtaVoz=sim(RedVoz,MF(:))
pause(3);
end