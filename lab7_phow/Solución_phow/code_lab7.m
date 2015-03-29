clear all; close all;clc
Direct='x';
D=dir(fullfile(Direct,'*.mat'));
cnt=1;

for j=1:length(D)
    
    CM=fullfile(Direct,D(j).name);
    load(CM)
    suma1=0;
        for i=1:length(confus)
            suma1=suma1+diag(confus(i,i));
        end
        
    mean(j)=100*((suma1/length(confus))/15);
    
end
cat=[100 125 150 200];
plot(cat,mean(1:4))
hold on
plot(cat,mean(5:8))
hold on
plot(cat,mean(9:12))
hold on
plot(cat,mean(13:16))