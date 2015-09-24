function [s]=log_transform(r)
max=255;
c=2*max/log2(max+1);
s=uint8(c*log2(1+double(r)));