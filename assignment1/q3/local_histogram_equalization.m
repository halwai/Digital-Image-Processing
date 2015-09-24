function img_histeq_local=local_histogram_equalization(img,window_size)
%r= window size for local histograms
%assuming that windoe size is small righ end and bottom end may not be
%completely processed
if nargin==1
    window_size=10;
end
r=window_size;
img_histeq_local=img;
for i=1:size(img,1)/r
    for j=1:size(img,2)/r
        img_part=img( (i-1)*r+1:i*r , (j-1)*r+1:j*r );
        img_histeq_local( (i-1)*r+1:i*r , (j-1)*r+1:j*r )=histeq(img_part);
    end
end