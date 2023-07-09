clear;clc;
cam=webcam();
cam.Resolution='640x480';
c=0;
GESTO_4=zeros(640*480,100);
CAT_=zeros(5,100);
while c<100
img=snapshot(cam);
[a,b]=maskprueba(img);
a=bwareaopen(a,1000);
c=c+1;
GESTO_4(:,c)=a(:);
CAT_4(4,c)=1;
imshow(a);
end
save DatosG4.mat GESTO_4 CAT_4
clear cam