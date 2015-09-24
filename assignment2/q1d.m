%1d
clear
img1 = imread('soy-dessert.jpg');
img2 = imread('vegan-modified.jpg');
img1 = imresize(img1,0.5);
img2 = imresize(img2,0.5);
[l1 b1] = size(img1);
[l2 b2] = size(img2);

%for template only once to be calculate so calculate directly via inbuilt functions
template_std = std(double(img1(:)));
template_kernel = double( double(img1(:)) - repmat ( mean(img1(:)) ,l1*b1,1 ) )/template_std/prod(size(img1)) ;

temp=zeros(l2-l1,b2-b1);
tic;
temp_mean = integral_image(double(img2),1);
temp_mean = mean_window(temp_mean,l1,b1);

temp_deviation = integral_image(double(img2),2);
temp_deviation = variance_window(temp_deviation,temp_mean,l1,b1);
temp_deviation = temp_deviation.^0.5;

normalized_co_diff = @(x,i,j) double ( sum ( (  double(x(:))   ...
    .*  template_kernel  ) - (temp_mean(i,j) *l1*b1 ) * sum(template_kernel)) )...
    / temp_deviation(i,j) ;

for i=1:l2-l1
    for j=1:b2-b1
        temp(i,j)=normalized_co_diff( img2 ( i : i+l1-1 , j : j+b1-1 ) ,i,j );
    end
end
toc
% min_val place in the image
[max_val max_index]=max(temp(:));
[r c] = ind2sub(size(temp),max_index);
%gray to color for colorful box
img_final(:,:,1) = img2;
img_final(:,:,2) = img2;
img_final(:,:,3) = img2;
%negarive green-rectangle
img_final( r     , c:c+b1 ,2) = 255*zeros(1,b1+1);
img_final( r+l1  , c:c+b1 ,2) = 255*zeros(1,b1+1);
img_final( r:r+l1, c      ,2) = 255*zeros(l1+1,1);
img_final( r:r+l1, c+b1   ,2) = 255*zeros(l1+1,1);

figure;
imshow(img_final);
title('1d');

'now since the values are zero centered and normalized by standard deviation '
'the corelation operator gives the result in normalized region and thus gives the right result'