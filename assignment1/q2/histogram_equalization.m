%input- image histogram ,total_no of pixels of the image whose transform is
%to be calculated
%output - transformation function  to  equidistant histogram
function [t] = histogram_equalization(img_hist,total_pixels)

max = 255;
img_hist_cum = cumsum(img_hist);
t =  ( (max )  * img_hist_cum );
t=ceil(t/sum(img_hist));
%figure,imhist(img);
%figure,plot(img_hist_cum);
