% Piramide LOW PASS
clear all;close all;clc;
%Se leen las dos imagenes 
x=imread('fish.bmp');
x2=imread('submarine.bmp');
%Se creen los parametros del filtro guassiano
HSIZE=[20 20];
SIGMA=9;
h=fspecial('gaussian',HSIZE,SIGMA);
FL0=imfilter(x,h,'replicate');
I0=impyramid(x,'reduce');
FL1=imfilter(I0,h,'replicate');
I1 = impyramid(I0, 'reduce');
FL2=imfilter(I1,h,'replicate');
I2 = impyramid(I1, 'reduce');
FL3=imfilter(I2,h,'replicate');



% Piramide high PASS

FH0=imfilter(x2,h,'replicate');
J0=impyramid(x2,'reduce');
FH1=imfilter(J0,h,'replicate');
J1 = impyramid(J0, 'reduce');
FH2=imfilter(J1,h,'replicate');
J2 = impyramid(J1, 'reduce');
FH3=imfilter(J2,h,'replicate');

%high pass


K0=FL0+(x2-FH0);
K1=FL1+(FH0-FH1);
K2=FL2+(FH2-FH1);
K3=FL3+(FH3-FH1);


figure;
subplot(2,3,1), subimage(K0);
subplot(2,3,2), subimage(K1);
subplot(2,3,3), subimage(K2);
subplot(2,3,4), subimage(K3);

