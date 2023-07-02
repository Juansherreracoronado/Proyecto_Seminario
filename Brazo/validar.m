clear;clc
load RedRobot.mat
load Datos2R.mat

X=-3.2
Y=14.121

Rta=sim(Red,[X;Y])

Bobot.plot(Rta')
Bobot.teach();
view(33,42);
zlim([-5 12]);
MTH=Bobot.fkine(Rta');
Px=MTH(1,4);
Py=MTH(2,4);
ErrorX=(abs(X-Px)/abs(X))*100
ErrorY=(abs(Y-Py)/abs(Y))*100