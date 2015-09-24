%% Abhijeet Kumar 
% CSD 201302197

%chroma keying 
%q3

clear all;
clc;

% both images are expected to be in rgb format 
% and of different sizes (backgound > foreground)

%img_f foreground image
%img_b background image
img_f=imread('./chroma2.jpg');
img_b=imread('./background.jpg');

% sizes of both the images
fsize = size(img_f);
bsize = size(img_b);

% dimensions to pad in foreground image
pad_dim=[ bsize(1)-fsize(1),bsize(2)-fsize(2)];
%padding the foreground image
img_f_sized = padarray( img_f, pad_dim ,'pre') ;

%threshold  in green color
min_threshold = 250;
max_threshold = 225;

%index of non-green points
non_green=find((img_f_sized(:,:,2) < max_threshold & img_f_sized(:,:,2) > 0) ...
                |  img_f_sized(:,:,2) > min_threshold +15);


% final image from img_f_sized and img_b using img_f_binary
%final image is constructed usinbg background image
final_img=img_b;
% at non-green points final_img is equivalent to foreground image
final_img(non_green) = img_f_sized(non_green);
final_img(prod(bsize)/3+non_green) = img_f_sized(prod(bsize)/3+non_green);
final_img(2*prod(bsize)/3+non_green) = img_f_sized(2*prod(bsize)/3+non_green);

%show all images
figure;

subplot( 2,1, 1);
imshow(img_f);
title('foreground-image');

subplot( 2 ,1, 2);
imshow(img_b);
title('background-image');

figure
imshow(final_img);
title('chroma-keying-image');
