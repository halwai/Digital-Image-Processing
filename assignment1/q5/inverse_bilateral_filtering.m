%inverse bilateral filtering

function [img_bilateral]=inverse_bilateral_filtering(img,window_size,sigma_gaussian,sigma_intensity)
img=double(img);
wl = (window_size-1)/2;
wr = (window_size-1)/2;
length=size(img,1);
breadth=size(img,2);

x = repmat( [ -wl:1:wr ]  , window_size , 1 );
y = repmat( [ -wl:1:wr ]' , 1,  window_size );
m1 = -( x.*x + y.*y )/ (2 *sigma_gaussian^2 ) ;
g1 = exp(m1)/(sigma_gaussian*sqrt(2*pi));

img_bilateral=img;
padarray(img_bilateral,[wl wr],'replicate','both');

for i=1+wl:length-wr
    for j=1+wl:breadth-wr
        z1 = repmat( [ img(i,j) ] , window_size , window_size );
        z2 = img( i-wl : i+wr , j-wl :j+wr );
        z = z2 - z1;
        m2 = -(1^2- z.*z ) / (2 * sigma_intensity^2) ;
        g2 = exp( m2 )/(sqrt(2*pi)*sigma_intensity);
        temp = g2 .* g1 ;
        normal = sum(temp(:));
        img_bilateral( i,j ) = sum(sum(z2.*temp))/normal;
    end
end

img_bilateral=uint8(img_bilateral(1:length,1:breadth));

