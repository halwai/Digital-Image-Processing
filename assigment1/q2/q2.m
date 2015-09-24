function q2()

%histogram-equalization
max=255;
img = imread('./office.jpg');
length = size( img , 1 );
breadth = size( img , 2 );
dim = size(img,3);

for i=1:3
    t(:,:,i) = histogram_equalization ( imhist( img(:,:,i ) ) , length*breadth );%t is transformation function
end
img_new1 = t( img + uint8( ones ( length , breadth ,dim ) ) );

figure('Name','histogram-equalization');
subplot(1,2,1);     imshow(img);            title('original-image');
subplot(1,2,2);     imshow(uint8(img_new1)); title('final-image');
figure('Name','histogram-equalization_fff');
imhist(rgb2gray(uint8(img_new1)))

%histogram-specification

%ramp function
ramp=ones(256,1);
ramp=cumsum(ramp);
t_ramp = histogram_equalization( ramp ,256*256 );
t_ramp_inverse=zeros(256,1);
for i=1:256
    if t_ramp(i) == 0
        t_ramp_inverse( t_ramp(i)  ) = i;
    else
        t_ramp_inverse( t_ramp(i) ) = i;
    end
end
for i=2:256
    if t_ramp_inverse(i) == 0
        t_ramp_inverse( i ) = t_ramp_inverse(i-1);
    else
        t_ramp_inverse( i )= t_ramp_inverse( i ) - 1;
    end
end
img_new2 = t_ramp_inverse( uint8(img_new1)   );


%step function
step(:,1)=zeros(128,1);
step(129:256,1)=ones(128,1);
t_step = histogram_equalization( step ,256*256 );
t_step_inverse=zeros(256,1);
for i=1:256
    if t_step(i) == 0
        t_step_inverse( t_step(i) +1 ) = i;
    else
        t_step_inverse( t_step(i) ) = i;
    end
end
for i=2:256
    if t_step_inverse(i) == 0
        t_step_inverse( i ) = t_step_inverse(i-1);
    else
        t_step_inverse( i )= t_step_inverse( i ) - 1;
    end
end
img_new3 = t_step_inverse( uint8(img_new1) );

figure('Name','step-histogram_specification')
subplot(2,1,1),plot(t_step);          title('intensity-transform');
subplot(2,1,2),plot(t_step_inverse);     title('inverse-intensity-transform');

figure('Name','ramp-histogram_specification')
subplot(2,1,1),plot(t_ramp);             title('intensity-transform');
subplot(2,1,2),plot(t_ramp_inverse);         title('inverse-intensity-transform');

figure('Name','histogram-specification');
subplot(1,3,1);     imshow(img);            title('original-image');
subplot(1,3,2);     imshow(uint8(img_new2)); title('final-image-ramp-function');
subplot(1,3,3);     imshow(uint8(img_new3)); title('final-image-step-function');