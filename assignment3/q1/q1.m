%% Abhijeet Kumar 
% CSD 201302197

% extrracting yellow stars
% q1
clear all;
clc;

[img , cmap] = imread('./octone.gif');

c=zeros(256,3);
for i=1:256
    if cmap(i,1) >0.5 & cmap(i,2) > 0.5 & cmap(i,3) <0.5
        c(i,:) = cmap(i,:);
    end
end
imshow(img,c);
