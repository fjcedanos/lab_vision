function my_segmentation = segment_by_clustering(rgb_ima,fs,cm,k)

I=imread('rgb_ima');
if strcmp(fs,'rgb')==true
    Ima=I;
elseif strcmp(fs,'lab')==true
    cform = makecform('srgb2lab');
    Ima = applycform(I,cform);
elseif strcmp(fs,'hsv')==true
    cform = makecform('srgb2xyz');
    Ima = applycform(I,cform); 
end

ab = double(Ima(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = k;

if strcmp(cm,'kmeans')==true

[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);

end

if strcmp(cm,'gmm')==true
    
   gm=gmdistribution.fit(ab,k);
   cluster_idx=cluster(gm,ab);
   pixel_labels=reshape(cluster_idx,nrows,ncols);
   
   
end



my_segmentation=pixel_labels;
% imshow(pixel_labels,[]);colormap(jet(k))
    
end

