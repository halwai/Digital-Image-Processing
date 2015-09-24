%3a

% $$\ F(u,v) = \sum_{n=-\infty}^{\infty} \sum_{m=-\infty}^{\infty} f(m,n)e^{-j2\pi(\frac{um}{M}  + \frac{vn}{N})}$

s =100; %scale -factor
img=imread('./rupee-symbol.jpg');
img_dft=fft2(double(img));
img_dft=fftshift(img_dft);

img_new=s*double(img);
img_new_dft=fft2(img_new);
img_new_dft=fftshift(img_new_dft);

figure;
subplot(1,2,1) ,imshow(img);title('original-image');
subplot(1,2,2) ,imshow(uint8(img_new));title('scaled-image');


figure;
subplot(1,2,1) ,imshow(mat2gray(log(ones(size(img))+abs(img_dft))));     title('original-image');
subplot(1,2,2) ,imshow(mat2gray(log(ones(size(img))+abs(img_new_dft)))); title('scaled-image');



'img_new_dft is directly scaled to the same factor as img_new but due to log tranform a factor of log(s) is visible'