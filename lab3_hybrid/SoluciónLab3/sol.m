% Piramide LOW PASS
clear all;close all;clc;
%Se leen las dos imagenes 
x=imread('BMW_Logo.png');
x2=imread('Lotus_Logo.png');

%Se crean los parametros del filtro guassiano
HSIZE=[25 25];
SIGMA=5;
% Se crea el filtro
h=fspecial('gaussian',HSIZE,SIGMA);
%Primera imágen hibrida
Fx=imfilter(x,h);
Fx2=imfilter(x2,h);
K1=Fx+(x2-Fx2);
figure;imshow(K1)
imwrite(K1,'hybrid_one.png')
%Seguna imágen hibrida después del filtro en la piramite guassiana
x_1=impyramid(x,'reduce');
Fx_1=imfilter(x_1,h);
x2_1=impyramid(x2,'reduce');
Fx2_1=imfilter(x2_1,h);
K2=Fx_1+(x2_1-Fx2_1);
%Tercera imágen hibrida después del filtro en la piramite guassiana

x_2=impyramid(x_1,'reduce');
Fx_2=imfilter(x_2,h);
x2_2=impyramid(x2_1,'reduce');
Fx2_2=imfilter(x2_2,h);
K3=Fx_2+(x2_2-Fx2_2);
%Cuarta imágen hibrida después del filtro en la piramite guassiana

x_3=impyramid(x_2,'reduce');
Fx_3=imfilter(x_3,h);
x2_3=impyramid(x2_2,'reduce');
Fx2_3=imfilter(x2_3,h);
K4=Fx_3+(x2_3-Fx2_3);

%Quinta imágen hibrida después del filtro en la piramite guassiana

x_4=impyramid(x_3,'reduce');
Fx_4=imfilter(x_4,h);
x2_4=impyramid(x2_3,'reduce');
Fx2_4=imfilter(x2_4,h);
K5=Fx_4+(x2_4-Fx2_4);
%Sexta y última imágen hibrida después del filtro en la piramite guassiana

x_5=impyramid(x_4,'reduce');
Fx_5=imfilter(x_5,h);
x2_5=impyramid(x2_4,'reduce');
Fx2_5=imfilter(x2_5,h);
K6=Fx_5+(x2_5-Fx2_5);

figure;
subplot(2,3,1), imshow(K1);
subplot(2,3,2), imshow(K2);
subplot(2,3,3), imshow(K3);
subplot(2,3,4), imshow(K4);
subplot(2,3,5), imshow(K5);
subplot(2,3,6), imshow(K6);