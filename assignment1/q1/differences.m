function differences()
img1=imread('spot1-diff1.jpg');
img2=imread('spot1-diff2.jpg');
img_diff=img1-img2;
img_mod_fun=str2func('img_mod');
binary_img=arrayfun(img_mod_fun,img_diff(:,:,1),img_diff(:,:,2),img_diff(:,:,3));
img_gray=double(rgb2gray(img1));
binary_img=make_rectangular(binary_img);
figure('Name','set2');
subplot(1,2,1);imshow((uint8(binary_img))); title('thresholded difference map');
final_img(:,:,1) = double((img_gray))+double(binary_img(:,:,1));
final_img(:,:,2) = double((img_gray));
final_img(:,:,3) = double((img_gray));
subplot(1,2,2);imshow(uint8(final_img));title('annotated image');

clear

img1=imread('spot2-diff1.png');
img2=imread('spot2-diff2.png');
img_diff=img1-img2;
img_mod_fun=str2func('img_mod');
binary_img=arrayfun(img_mod_fun,img_diff(:,:,1),img_diff(:,:,2),img_diff(:,:,3));
img_gray=double(rgb2gray(img1));
binary_img=make_rectangular(binary_img);
figure('Name','set2');
subplot(1,2,1);imshow((uint8(binary_img)));title('thresholded difference map');
final_img(:,:,1) = double((img_gray))+double(binary_img(:,:,1));
final_img(:,:,2) = double((img_gray));
final_img(:,:,3) = double((img_gray));
subplot(1,2,2);imshow(uint8(final_img));title('annotated image');

