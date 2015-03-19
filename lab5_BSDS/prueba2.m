clc;clear all;close all;
%Se corre la función

imageDir = 'BSDS500/data/images/test';
D = dir(fullfile(imageDir,'*.jpg'));
%Método 1
cnt_1=1;

for i=1:length(D)
    for k = 2:5
        
    imageFiles{i} = fullfile(imageDir, D(i).name);
    images{i} = imread(imageFiles{i});
    [pathstr,name{i},ext] = fileparts(imageFiles{i});
   
    segs{1,cnt_1}=segment_by_clustering(images{i},'lab','kmeans',k);
%     segs{1,cnt_1}=segment_by_clustering(images{i},'lab','gmm',k);
    cnt_1=cnt_1+1;
    filename=strcat(name{i},'.mat');
    imageDirOut='Evaluacion_FJCS/kmean';
    save(fullfile(imageDirOut,filename),'segs')
    
    end
    cnt_1=1;
end
