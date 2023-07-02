clear;clc;
% AQUI VAN LOS DATOS DE SUUUUUU ROBOT
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
plot(VecX9,VecY9,'ro');
plot(Rx9,Ry9,'k*');
