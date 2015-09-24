%1b
%template matching 
%1a
clear
img1 = double(imread('soy-dessert.jpg'));
img2 = double(imread('vegan-modified.jpg'));
img1 = imresize(img1,0.5);
img2 = imresize(img2,0.5);
[l1 b1] = size(img1);
[l2 b2] = size(img2);

sum_abs_diff = @(x) sum( abs ( x(:)-img1(:) ) );

%absolute difference convolution  
temp=zeros(l2-l1,b2-b1);
for i=1:l2-l1
    for j=1:b2-b1
        temp(i,j)=sum_abs_diff ( img2 ( i : i+l1-1 , j : j+b1-1 ) );
    end
end

% min_val place in the image
[min_val min_index]=min(temp(:));
[r c] = ind2sub(size(temp),min_index);
%gray to color for colorful box
img_final(:,:,1) = img2;
img_final(:,:,2) = img2;
img_final(:,:,3) = img2;
%negative-green-rectangle
img_final( r     , c:c+b1 ,1) = 255*zeros(1,b1+1);
img_final( r+l1  , c:c+b1 ,1) = 255*zeros(1,b1+1);
img_final( r:r+l1, c      ,1) = 255*zeros(l1+1,1);
img_final( r:r+l1, c+b1   ,1) = 255*zeros(l1+1,1);

figure;
imshow(uint8(img_final));
title('1a');


'absolute sum of  difference does not make any'
'sense because what defines an image is not only its gray levels but the relativeness'
'of this gray level with the neighbouring pixels as well'
'also size of the images may not be the same'
