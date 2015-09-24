function chip()
img_gray=imread('./chip.png');
max=uint8(255);    %max_intensity
if  size(img_gray,3) ~= 1 
    img_gray=img2gray(img_gray);
end
img_len=size(img_gray ,1);
img_heg=size(img_gray ,2);

%contrast adjustments  
%point processing
%negative
m=[max];
m=repmat(m,img_len,img_heg);
negative_img=m-img_gray;

%power_transformation
gamma_func=str2func('gamma_transform');
img_gamma=arrayfun(gamma_func ,img_gray);

%picewise_transformation on result of gamma tranformation
pice_func=str2func('picewise_transform');
img_pice=arrayfun(pice_func,img_gamma);

%log_transformation
log_func=str2func('log_transform');
img_log=arrayfun(log_func ,img_gray);

%binarisation by thresholding on result of log transformation
threshold_func=str2func('threshold_transform');
img_threshold=arrayfun(threshold_func,img_log);

% global processing
% histogram equalization  
img_hist_eq=histeq(img_gray);

%local histogram_equalization
img_histeq_local=local_histogram_equalization(img_gray);
%results and comparison
figure('Name','processed images(intensity transorms)','color','c')
subplot(2,3,1);     imshow(img_gray);       title('original-image');
%subplot(2,3,2);     imshow(negative_img);   title('negative-img');
subplot(2,3,2);     imshow(img_gamma);      title('gamma-tranform(0.2) & picewise combination','color','r');
subplot(2,3,3);     imshow(img_log);        title('log-transfrom','color','r');
subplot(2,3,4);     imshow(img_threshold);  title('log-transfrom & binary-thresholding');
subplot(2,3,5);     imshow(img_hist_eq);    title('histogram-equalization');
subplot(2,3,6);     imshow(img_histeq_local);    title('local-histogram-equalization(window-size=10)');

figure('Name','Histograms of corresponding images/image-tranforms','color','c');
subplot(2,3,1);     imhist(img_gray);       title('original-image');
%subplot(2,3,2);     imhist(negative_img);   title('negative-img');
subplot(2,3,2);     imhist(img_gamma);      title('gamma-tranform(0.2) & picewise combination','color','r');
subplot(2,3,3);     imhist(img_log);        title('log-transfrom','color','r');
subplot(2,3,4);     imhist(img_threshold);  title('log-transfrom & binary-thresholding');
subplot(2,3,5);     imhist(img_hist_eq);    title('histogram-equalization');
subplot(2,3,6);     imhist(img_histeq_local);    title('local-histogram-equalization(window-size=10)');

'Chp Designer :: National Instruments'