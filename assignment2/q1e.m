%1e

clear

img1 = imread('soy-dessert.jpg');
img2 = imread('vegan-modified.jpg');
img1 = imresize(img1,0.5);
img2 = imresize(img2,0.5);
[l1 b1] = size(img1);
[l2 b2] = size(img2);


tic 
temp=normxcorr2(img1,img2);
toc


%computation in frequency domain :: IDEAS

%Idea 1      using concepts of integral images
%divide the image window into two parts original image and mean image(on the whole image)
%now convolute with the given template and add the results of both 
%move back to spatial space and find the answer

img2=double(img2);
img1=double(img1);
template_std = std(img1(:));
template_kernel =  (img1 - mean(img1(:)))/template_std/l1/b1 ;

temp=zeros(l2-l1,b2-b1);
tic;
temp_mean = integral_image(img2,1);
temp_mean = mean_window(temp_mean,l1,b1);

temp_deviation = integral_image(img2,2);
temp_deviation = variance_window(temp_deviation,temp_mean,l1,b1);
temp_deviation = (abs(temp_deviation).^0.5);

temp= fft2((img2(1:l2-l1,1:b2-b1)./temp_deviation)) *fft2(fliplr(flipud(template_kernel)))    ...
   % -ifft2(fft2((temp_mean./temp_deviation)) ...
   % .*fft2(fliplr(flipud(template_kernel))));

temp=fliplr(flipud(ifft2(temp)));
toc;
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
imshow(uint8(img_final));
title('1e');

%Idea 2      without using concept of integral images  ( only idea is posed )
% the problem here is the basic area is large if the area is pruned then it is easir to match the template
% so we can use the idea of gaussian pyramids and resize images and perform template matching in this small resized image 
% and then go one level up and search only in the areas of intrest(good results) area for further improvements
