clear;clc
load Datos2R.mat

Red=fitnet(176);
INPUT=[Px;Py];
OUTPUT=Q;

Red=train(Red,INPUT,OUTPUT');

save RedRobot.mat Red