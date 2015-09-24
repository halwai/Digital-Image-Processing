function val=img_mod(a,b,c)
max=255;
threshold=max/80;
val=sqrt(double(a)^2+double(b)^2+double(c)^2)/9;
if val > threshold      %thresholding
    val=uint8(255);      
else 
    val=uint8(0);
end