function my_segmentation = segment_by_clustering(I,fs,cm,k)


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


if strcmp(cm,'kmeans')==true

    [cluster_idx, cluster_center] = kmeans(ab,k,'Distance','sqEuclidean', ...
                                      'Replicates',3);
    pixel_labels = reshape(cluster_idx,nrows,ncols);

end

% if strcmp(cm,'gmm')==true
%     
%    options=statset('Display','final');    
%    gm=gmdistribution.fit(ab,k,'Options',options,'regularize',0.0001);
%    cluster_idx=cluster(gm,ab);
%    pixel_labels=reshape(cluster_idx,nrows,ncols);
%    
% end



my_segmentation=pixel_labels;
% imshow(pixel_labels,[]);colormap(jet(k))
    
end

