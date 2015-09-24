% highpass   = original-lowpass OR
% high-boost = (k)original-lowpass where k is amplification factor or
% weight factor
%lowpass= gaussian here

function bell()
sigma=1;
img=double(imread('./bell.jpg'));
for k=2:2:10        % varying weight factors
    figure('Name',strcat('sharpening-filters ',' weight-factor=',int2str(k)));
    subplot(2,3,1) ,imshow(uint8(img));title('original-image')
    for i=1:5
        h=fspecial('gaussian',3*i+1,sigma); % different window sizes
        img_smooth=imfilter(img,h) ;        % masking 
        img_boosted=k*img-img_smooth;       % sharpened_image
        max_val=max(max(max(k*img)))-max(max(max(img_smooth))); % normalizing factor
         subplot(2,3,i+1);imshow(img_boosted/max_val);title(strcat('window-size=',int2str(3*i+1)));
    end
end

'step by step procedure in source code'