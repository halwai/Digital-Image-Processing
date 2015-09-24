function int_img=integral_img(img,power)
img=img.^power;
[l b]=size(img);
int_img=zeros(l,b);
for i=1:l
    for j=1:b
        if i==1 & j==1
            int_img(i,j) = img(i,j);
        elseif i==1
            int_img(i,j) = img(i,j)+int_img(i,j-1);
        elseif j==1
            int_img(i,j) = img(i,j)+int_img(i-1,j);
        else
            int_img(i,j) = img(i,j)+int_img(i-1,j)+int_img(i,j-1)-int_img(i-1,j-1);
        end
    end
end
