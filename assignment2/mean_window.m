function img_mean_window=mean_window(int_img,l1,b1)
[l2 b2]=size(int_img);
img_mean_window=zeros(l2-l1,b2-b1);
for i=1:l2-l1
    for j=1:b2-b1
        img_mean_window(i,j) = int_img(i,j) - int_img(i+l1,j) ...
                            - int_img(i,j+b1) + int_img(i+l1,j+b1);
        img_mean_window(i,j) = double(img_mean_window(i,j))/l1/b1;                            
    end
end
