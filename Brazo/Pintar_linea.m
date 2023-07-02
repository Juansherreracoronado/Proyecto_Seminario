clear;clc;
% AQUI VAN LOS DATOS DE SUUUUUU ROBOT
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
plot(VecX12,VecY12,'ro');
plot(Rx12,Ry12,'k*');

