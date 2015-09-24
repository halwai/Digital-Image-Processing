function [s]=threshold_transform(r)
max=255;
val=max/2;
if r<val 
    s=uint8(0);
else
    s=uint8(255);
end