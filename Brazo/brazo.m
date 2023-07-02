clear;clc;
% PILASSSSSSSSSS
% PONGA SUS DISTANCIAS!!!!!!
L1=3.13;
L2=11.63;
L3=1.7;
L4=9.774;

%Creando el robot
T(1)=Link('revolute','d',L1,'a',L2,'alpha',0);
T(2)=Link('revolute','d',L3,'a',L4,'alpha',0);
Bobot=SerialLink(T,'name','El fas');
cont=0;
paso=pi/60;

for ang1=0:paso:pi
    for ang2=0:paso:pi
        cont=cont+1;
q=[ang1 ang2]; %Debe estar en radianes
Q(cont,:)=q;
MTH=Bobot.fkine(q);
Px(cont)=MTH(1,4);
Py(cont)=MTH(2,4);
Pz(cont)=MTH(3,4);
    end
end
Bobot.plot([0 0])
Bobot.teach();
view(33,42);
zlim([-5 12]);
hold on
plot3(Px,Py,Pz,'b.')
save Datos2R.mat Q Px Py Bobot
