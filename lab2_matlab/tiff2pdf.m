clear all
close all
clc


images=dir('*.tiff');
l=size(images);
h=l(1);

for i=1:h
    name=images(i).name;
    IMAGE=imread(name);
    [a,name2,c]=fileparts(name);
    imwrite(IMAGE,[name2,'.jpg'])
end



