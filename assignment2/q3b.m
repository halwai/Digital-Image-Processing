%3b

s =2; %argument scale -factor
img=imread('./rupee-symbol.jpg');
img_dft=fft2(double(img));
img_dft=fftshift(img_dft);

img_new=double(imresize(img,s,'method','box'));
img_new_dft=fft2(img_new);
img_new_dft=fftshift(img_new_dft);

figure;
subplot(1,2,1) ,imshow(img);title('original-image');
subplot(1,2,2) ,imshow(uint8(img_new));title('argument-scaled-image');


figure;
subplot(1,2,1) ,imshow(mat2gray(log(ones(size(img))+abs(img_dft))));     title('original-image');
subplot(1,2,2) ,imshow(mat2gray(log(ones(size(img_new))+abs(img_new_dft)))); title('argument-scaled-image');

'if images are downsampled some inforrmations is lost :: details of high frequency is lost'
'if images are upsampled we may recover the same  iff interpolated samples are zero'