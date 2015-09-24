%3c

m =250; %scale -factor
n=100;
img=imread('./rupee-symbol.jpg');
img_dft=fft2(double(img));
img_dft=fftshift(img_dft);
[l b]=size(img);

img_new=circshift(double(img),[m n]);
img_new_dft=fft2(img_new);
img_new_dft=fftshift(img_new_dft);

figure;
subplot(1,2,1) ,imshow(img);title('original-image');
subplot(1,2,2) ,imshow(uint8(img_new));title('argument-shifted-image');


figure;
subplot(1,2,1) ,imshow(mat2gray(log(ones(size(img))+abs(img_dft))));     title('original-image');
subplot(1,2,2) ,imshow(mat2gray(log(ones(size(img))+abs(img_new_dft)))); title('argument-shifted-image');



'no change in abs(img_new_dft) but change in phase by a constant term dependent on m and n exponentialy'