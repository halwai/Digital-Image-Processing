function img_var_window=variance_window(int_img,mean_img,l1,b1)
[l2 b2]=size(int_img);
img_var_window=zeros(l2-l1,b2-b1);
for i=1:l2-l1
    for j=1:b2-b1
        img_var_window(i,j) = int_img(i,j) - int_img(i+l1,j) ...
                            - int_img(i,j+b1) + int_img(i+l1,j+b1);
        img_var_window(i,j) = (-double(img_var_window(i,j))/l1/b1 +  (mean_img(i,j)).^2); 
    end
end
