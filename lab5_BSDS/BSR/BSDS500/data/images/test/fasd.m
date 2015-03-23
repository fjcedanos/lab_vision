
clc;clear all;close all

I=imread('2018.jpg');
cform = makecform('srgb2lab');
Ima = applycform(I,cform);
ab = double(Ima(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
ab=ab';
distance = pdist(ab);
    cluster_tree = linkage(distance,'average');
    bn = cluster(cluster_tree,'cutoff',3);
   bn=bn';
    im_clust_out = reshape(bn,nrows,ncols);
    im_clust_out_exp1 = impyramid(im_clust_out,'expand'); 
    im_clust_out_exp2 = impyramid(im_clust_out_exp1,'expand');
    
%  distance = pdist(im_matrix);
%     tree = linkage(distance);
%     v_clust_out = cluster(tree,'cutoff',threshold);
%     im_clust_out = reshape(v_clust_out,[lwd(1),lwd(2)]);
%     im_clust_out_exp1 = impyramid(im_clust_out,'expand'); 
%     im_clust_out_exp2 = impyramid(im_clust_out_exp1,'expand');
%     my_segmentation = im_clust_out_exp2;
%     
