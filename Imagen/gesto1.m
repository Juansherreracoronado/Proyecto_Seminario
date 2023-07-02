clear;clc;
cam=webcam();
cam.Resolution='640x480';
c=0;
GESTO_1=zeros(640*480,100);
CAT_1=zeros(4,100);
while c<100
img=snapshot(cam);
[a,b]=maskprueba(img);
a=bwareaopen(a,1000);
c=c+1;
GESTO_1(:,c)=a(:);
CAT_1(1,c)=1;
imshow(a);
end
save DatosG1.mat GESTO_1 CAT_1
clear cam
