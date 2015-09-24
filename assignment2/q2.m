%2a
threshold=0.75;

img=imread('./test-images-for-q2/son3.gif');
angle=find_angle(img,threshold)

img=imread('./test-images-for-q2/son3rot1.gif');
angle=find_angle(img,threshold)

img=imread('./test-images-for-q2/son3rot2.gif');
angle=find_angle(img,threshold)

img=imread('./test-images-for-q2/son3rot3.gif');
angle=find_angle(img,0.85)
