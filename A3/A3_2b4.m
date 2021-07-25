clc;
clear all;

% The original image
%subplot(2,2,1); 
image=imread("lenna.png"); % reads an image file
imshow(image); % display the image in the graphics file with filename=image
%title('Original Image'); % title of the figure

% Scaling to gray
%subplot(2,2,2); % Subplot 2
GrayScale=rgb2gray(image); % . The rgb2gray function converts RGB images to grayscale by eliminating the hue and saturation information while retaining the luminance
imshow(GrayScale); % display the image in the graphics file with filename=G
%title('Gray Scale of Original Image');

%Gradient 3x3 kernel
%G_H
subplot(2,2,1);
Gh=zeros(3,3)
Gh(1,:)=[-1 -1 -1]; 
Gh(2,:)=[0 0 0];
Gh(3,:)=[1 1 1];  
con=convn(Gh,image)  %for N-Dimention conv
imshow(con)
title('G_H with Original image')
%with grayscale image
subplot(2,2,2);
con=convn(Gh,GrayScale)  %for N-Dimention conv
imshow(con)
title('G_H with GrayScale image')

%G_V
subplot(2,2,3);
Gv=zeros(3,3)
Gv(1,:)=[-1 0 1]; 
Gv(2,:)=[-1 0 1];
Gv(3,:)=[-1 0 1];  
con=convn(Gv,image)  %for N-Dimention conv
imshow(con)
title('G_V with Original image')

subplot(2,2,4);
con=convn(Gv,GrayScale)  %for N-Dimention conv
imshow(con)
title('G_V with GrayScale image')



