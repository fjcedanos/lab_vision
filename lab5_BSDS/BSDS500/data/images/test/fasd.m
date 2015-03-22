
clc;clear all;close all

I=imread('2018.jpg');
cform = makecform('srgb2lab');
Ima = applycform(I,cform);
subplot(1,2,1),imshow(Ima)
subplot(1,2,2),imshow(I)