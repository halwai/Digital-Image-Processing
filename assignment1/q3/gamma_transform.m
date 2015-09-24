function [s]=gamma_transform(r)
max=255;
c=255/(255^0.2);
s=uint8(c*(double(r)^0.2));
