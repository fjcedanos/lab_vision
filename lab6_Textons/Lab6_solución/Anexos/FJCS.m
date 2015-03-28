clear all;close all;clc;
addpath('lib')
imageDir='train';
% create filter bank

[fb] = fbCreate;

D = dir(fullfile(imageDir,'*.jpg'));

cnt=1;
im=[];
for i=30:30:length(D)
    % % imagen de referencia para construir diccionario de textones
    %Una de cada categoría
    
    imageFiles{cnt} = fullfile(imageDir,D(i).name);
    ima=double((imread(imageFiles{cnt})))/255;
    im = [im ima];
    cnt=cnt+1;
end

% numero de textones en diccionario
k = 50;

% u=cell2mat(fbRun(fb,im));
% [m,n]=size(u);
% re=reshape(u,[1,m*n]);
% y=randsample(re,5000);
fim=fbRun(fb,im);
% diccionario de textones
tic
[map,textons] = computeTextons(fim,k);
toc
% figure;imshow(map,[]);colormap(jet);
%% 
%Histograma de Train
addpath('Var2')
load('fb');
load('TEXTONS')
k=50;
imageDir2='train';
D2=dir(fullfile(imageDir2,'*.jpg'));
cnt2=1;
% texton maps de dos nuevas imagenes
tic
for i=1:numel(D2),
    imageFiles2{cnt2} = fullfile(imageDir2,D2(i).name);
    ima2=double((imread(imageFiles2{cnt2})))/255;
    tmap = assignTextons(fbRun(fb,ima2),textons');
    HIS{i}=histc(tmap(:),1:k)/numel(tmap);
    cnt2=cnt2+1;  
end
toc
%% 
%Histogramas de Test
addpath('Var2')
load('fb');
load('TEXTONS')
k=50;
imageDir2='test';
D2=dir(fullfile(imageDir2,'*.jpg'));
cnt2=1;
% texton maps de dos nuevas imagenes
tic
for i=1:numel(D2),
    imageFiles2{cnt2} = fullfile(imageDir2,D2(i).name);
    ima2=double((imread(imageFiles2{cnt2})))/255;
    tmap = assignTextons(fbRun(fb,ima2),textons');
    HIS_T{i}=histc(tmap(:),1:k)/numel(tmap);
    cnt2=cnt2+1;  
end
toc
%%
%promedio de histogramas en cada clasificador

addpath('Variables')
load('HIS')
load('textones')
load('fb')
k=50;
imageDir2='train';
D2=dir(fullfile(imageDir2,'*.jpg'));
cnt2=1;

for i=1:30:numel(D2),
    
    for j=1:30%length(HIS)
        HIST=zeros(50,1);
        HIST=HIST+HIS{(j-1)+i};
    end
HMEAN{cnt2}=HIST/30;
cnt2=cnt2+1;
    
end
