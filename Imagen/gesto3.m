clear;clc;
cam=webcam();
cam.Resolution='640x480';
c=0;
GESTO_3=zeros(640*480,100);
CAT_3=zeros(5,100);
while c<100
img=snapshot(cam);
[a,b]=maskprueba(img);
a=bwareaopen(a,1000);
c=c+1;
GESTO_3(:,c)=a(:);
CAT_3(3,c)=1;
imshow(a);
end
save DatosG3.mat GESTO_3 CAT_3
clear cam