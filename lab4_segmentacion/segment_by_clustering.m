function my_segmentation = segment_by_clustering(I,fs,cm,k)

if fs=='rgb'
    Ima=I;
elseif fs=='lab'
    cform = makecform('srgb2lab');
    Ima = applycform(I,cform);
elseif fs=='hsv'
    cform = makecform('srgb2xyz');
    Ima = applycform(I,cform); 
end

if cm=='kmeans'


ab = double(Ima(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = k;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);

% title('image labeled by cluster index')
end
my_segmentation=imshow(pixel_labels,[]);colormap(jet(k))