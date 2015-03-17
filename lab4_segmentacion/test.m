clc;clear all;close all;

%Se corre la función
x=imread('3063.jpg');
    cform = makecform('srgb2lab');
    Ima = applycform(x,cform);

k=3;

ab = double(Ima(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = k;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors);
pixel_labels = reshape(cluster_idx,nrows,ncols);
pu=cluster_center;
% segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[]);
imshow(rgb_label,[])
% for h = 1:nColors
%    color = Ima;
%     color(rgb_label ~= h) = 0;
%     segmented_images{h} = color;
%     
% end
% ImaF=zeros;
% for l=1:k
%     
%     ImaFa=segmented_images{l};
%     ImaF=ImaF+ImaFa;
% end
% % imshow(segmented_images{3});
% 
% figure;imshow(ImaF);figure;imshow(Ima)