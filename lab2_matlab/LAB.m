clc;clear all;close all;
x=1;
archivo = 'C:\Users\fj.cedano803\Documents\GitHub\lab_vision\lab2_matlab\misc'; 
ext = '*.tiff';
x = fullfile(archivo,ext);
lista = dir(x);
for n = 1:numel(lista)
    info = imfinfo(fullfile(archivo,lista(n).name),ext(end-3:end));
    Nom = info.Filename;
    img = imread(fullfile(archivo,lista(n).name),ext(end-3:end));
  hold on
    imshow(img);
    img2 = [Nom(1:end-4) '.jpg']; 
    imwrite(img,img2); 
  hold off
end

%%
%Se añade ruido de sal y pimienta
x=imread('4.1.04.tiff');
y=imnoise(x,'salt & pepper');
imshow(y)
figure(2);imshow(x)
%Se pasa un flitro mediano
m=fspecial('average');
n=imfilter(y,m);
figure(3);imshow(n)
