function q1()
img1=imread('./spot1-diff1.jpg');
img2=imread('./spot1-diff2.jpg');
window_size=15;
length=size(img1,1);
breadth=size(img1,2);
img1=padarray(img1,[window_size-mod(length,window_size) window_size-mod(breadth,window_size)],'post');
img2=padarray(img2,[window_size-mod(length,window_size) window_size-mod(breadth,window_size)],'post');
final_img=img1;
length=size(img1,1);
breadth=size(img1,2);
for i=1:length/window_size
    for j=1:breadth/window_size
        val=cov(double(img1((i-1)*window_size+1:i*window_size ,(j-1)*window_size+1:j*window_size))...
                  ,double(img2((i-1)*window_size+1:i*window_size ,(j-1)*window_size+1:j*window_size)));
        if val(2,1)/val(1,1)>1.02 && val(2)~=NaN
            val(2,1)/val(1,1)
            final_img( (i-1)*window_size+1:i*window_size,(j-1)*window_size+1:j*window_size,:) ...
                =repmat([255],window_size,window_size,3);
        end
    end
end

imshow(final_img(1:length-window_size,1:breadth-window_size,1:3));