function my_segmentation = segment_by_clustering(I,fs,cm,k)

% I, es la imagen de entrada
% fs, feature space puede ser: 'rgb', 'lab', 'hsv'
% cm, clustering method: Método empleado para segmentar las imagenes:
% 'kmens', 'gmm', 'hierarchical','
if strcmp(fs,'rgb')==1
Ima=I;
    
elseif strcmp(fs,'lab')==1
cform = makecform('srgb2lab');
Ima = applycform(I,cform);

elseif strcmp(fs,'hsv')==1
cform = makecform('srgb2xyz');
Ima = applycform(I,cform); 
end

ab = double(Ima(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
%%Segmentación
%Método: KMEANS
if strcmp(cm,'kmeans')==1

 [cluster_idx, cluster_center] = kmeans(ab,k,'Distance','sqEuclidean','Replicates',3);
 pixel_labels = reshape(cluster_idx,nrows,ncols);

%Método: Gaussian Mixture Model GMM
elseif strcmp(cm,'gmm')==1
    
   options=statset('Display','final');    
   gm=gmdistribution.fit(ab,k,'Options',options,'regularize',0.0001);
   cluster_idx=cluster(gm,ab);
   pixel_labels=reshape(cluster_idx,nrows,ncols);
   
%Método: hierarchical

elseif strcmp(cm,'hc') == 1 
    %Threshold definition
%     umbral = 1;
    distance = pdist(ab);
    cluster_tree = linkage(distance,'average');
    clust_idx = cluster(cluster_tree,'cutoff',3);
    
    pixel_labels=reshape(cluster_idx,nrows,ncols);

%     im_clust_out = reshape(v_clust_out,[lwd(1),lwd(2)]);
%     im_clust_out_exp1 = impyramid(im_clust_out,'expand'); 
%     im_clust_out_exp2 = impyramid(im_clust_out_exp1,'expand');
%     
%     my_segmentation = im_clust_out_exp2;
    
%Método: Watershed

elseif strcmp(cm,'ws') == 1 
    
    Ima_gris=rgb2gray(Ima);
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(Ima_gris), hy, 'replicate');
    Ix = imfilter(double(Ima_gris), hx, 'replicate');
    IxIy = sqrt(Ix.^2 + Iy.^2);
    
    
    %Extended regional minima
%   h_min = 40;
    markers = imextendedmin(IxIy,k);
    ngrad = imimposemin(IxIy,markers);
%     
    pixel_labels = watershed(ngrad);
    Lrgb = label2rgb(pixel_labels, 'jet', 'w', 'shuffle');
    
    
end

my_segmentation=pixel_labels;
imshow(Ima)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
% imshow(pixel_labels,[]);colormap(jet(k))
end

