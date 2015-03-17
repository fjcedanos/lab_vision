clc;clear all;close all;
%Se corre la función
x=imread('5096.jpg');

y=segment_by_clustering(x,'lab','kmeans',5);