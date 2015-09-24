function q5()
%5(a)
img=imread('./face.png');
img2=bilateral_filtering(img,7,10,20);
figure('Name','face-bilateral-filtering')
subplot(1,2,1);imshow(img); title('original-image');
subplot(1,2,2);imshow(img2);title('filtered-image');

%5(b)
img=imread('./boy_smiling.jpg');
img2=img;

% variable window size
sigma1=10.0;
sigma2=20.0;
figure('Name','variable window sizes');
subplot(2,3,1);imshow(img);title('original-image');
i=2;
for k=[5 11 15 21 37]
    img2(:,:,1)=bilateral_filtering(img(:,:,1),k, sigma1,sigma2);
    img2(:,:,2)=bilateral_filtering(img(:,:,2),k, sigma1,sigma2);
    img2(:,:,3)=bilateral_filtering(img(:,:,3),k, sigma1,sigma2);
    subplot(2,3,i);imshow(img2);title(strcat('window-size= ',int2str(k)));
    i=i+1;
end

% variable gaussian sigma
sigma2=20.0;
k=7;
figure('Name','variable gaussian sigma');
subplot(2,3,1);imshow(img);title('original-image');
i=2;
for sigma1=[ 0.1 0.5 1 5 10 ]
    img2(:,:,1)=bilateral_filtering(img(:,:,1),k, sigma1,sigma2);
    img2(:,:,2)=bilateral_filtering(img(:,:,2),k, sigma1,sigma2);
    img2(:,:,3)=bilateral_filtering(img(:,:,3),k, sigma1,sigma2);
    subplot(2,3,i);imshow(img2);title(strcat('gaussian sigma = ',num2str(sigma1)));
     i=i+1;
end


sigma1=10.0;
k=7;
figure('Name','variable intensity sigma');
subplot(2,3,1);imshow(img);title('original-image');
i=2;
for sigma2=[0.5 1 5 15 25 ]
    img2(:,:,1)=bilateral_filtering(img(:,:,1),k, sigma1,sigma2);
    img2(:,:,2)=bilateral_filtering(img(:,:,2),k, sigma1,sigma2);
    img2(:,:,3)=bilateral_filtering(img(:,:,3),k, sigma1,sigma2);
    subplot(2,3,i);imshow(img2);title(strcat('intensity sigma = ',num2str(sigma2)));
    i=i+1;
end


%cartonizing effects


%5(c)
%for image segmentation by edge detection 
%salient part detection with some more info(which can be used for feature detection)
%edge detection
img=imread('./boy_smiling.jpg');
img2=img;
sigma1=10.0;
sigma2=10.0;
figure('Name','inverse -bilateral');
subplot(1,3,1);imshow(img);title('original-image');

k=5;
img2(:,:,1)=inverse_bilateral_filtering(img(:,:,1),k, sigma1,sigma2);
img2(:,:,2)=inverse_bilateral_filtering(img(:,:,2),k, sigma1,sigma2);
img2(:,:,3)=inverse_bilateral_filtering(img(:,:,3),k, sigma1,sigma2);
subplot(1,3,2);imshow(img2);title(strcat('inverse bilateral image'));

img_diff=img2-img;
subplot(1,3,3);imshow(img_diff);title('edge map');
