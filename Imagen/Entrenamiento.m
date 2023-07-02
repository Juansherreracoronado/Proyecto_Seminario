clear;clc;
Red_Gestos=patternnet(100);
load('DatosG1.mat')
load('DatosG2.mat')
load('DatosG3.mat')
load('DatosG4.mat')

INPUT=[GESTO_1 GESTO_2 GESTO_3 GESTO_4];
OUTPUT=[CAT_1 CAT_2 CAT_3 CAT_4];
%OUTPUT=horzcat(CAT_1,CAT_2,CAT_3);
Red_Gestos=train(Red_Gestos,INPUT,OUTPUT);

save Red1.mat Red_Gestos