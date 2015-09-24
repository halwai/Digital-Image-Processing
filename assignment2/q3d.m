%3d

img=imread('./rupee-symbol.jpg');
img_dft=fft2(double(img));
img_dft=fftshift(img_dft);

[l b h]=size(img);
n=b/2;

img_new=img;
img_new(:,n+1:b,:)=img(:,b-n:-1:1,:);
img_new_dft=fft2(img_new);
img_new_dft=fftshift(img_new_dft);

figure;
subplot(1,2,1) ,imshow(img);title('original-image');
subplot(1,2,2) ,imshow(uint8(img_new));title('reflected-image');


figure;
subplot(1,2,1) ,imshow(mat2gray(log(ones(size(img))+abs(img_dft))));     title('original-image');
subplot(1,2,2) ,imshow(mat2gray(log(ones(size(img))+abs(img_new_dft)))); title('reflected-image');



'since information is lost dft will change'