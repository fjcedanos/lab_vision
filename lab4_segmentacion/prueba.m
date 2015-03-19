clc;clear all;close all;
%Se corre la función
x=imread('5096.jpg');


z=segment_by_clustering(x,'lab','gmm',3);
figure;imshow(x)