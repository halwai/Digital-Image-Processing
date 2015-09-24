function angle=find_angle(img,threshold)
    img_dft = fft2(img);
    img_dft = fftshift(img_dft);
    s = mat2gray(log(ones(size(img))+abs(img_dft))) > threshold;
    [r c] = find(s==1);
    r2=r;c2=c;
    angle=0;
    s=length(r);
    
    figure;
    imshow(img);
    for i=1:s
        temp=radtodeg((atan((repmat(c2(i),s,1)-c)./(repmat(r2(i),s,1)-r))));
        temp(isnan(temp)) = 90 ;
        temp( temp < 0 ) =  temp( temp < 0 ) +180;
        angle = angle+ sum(temp) -90;
    end
        angle = angle/(s)/(s-1);
        
end
