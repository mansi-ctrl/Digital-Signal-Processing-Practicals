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

%Sobel 3x3 kernel
%S_H
subplot(2,2,1);
Sh=zeros(3,3)
Sh(1,:)=[1 2 1]; 
Sh(2,:)=[0 0 0];
Sh(3,:)=[-1 -2 -1];  
con=convn(Sh,image)  %for N-Dimention conv
imshow(con)
title('S_H with Original image')
%with grayscale image
subplot(2,2,2);
con=convn(Sh,GrayScale)  %for N-Dimention conv
imshow(con)
title('S_H with GrayScale image')

%S_V
subplot(2,2,3);
Sv=zeros(3,3)
Sv(1,:)=[1 0 -1]; 
Sv(2,:)=[2 0 -2];
Sv(3,:)=[1 0 -1];  
con=convn(Sv,image)  %for N-Dimention conv
imshow(con)
title('S_V with Original image')

subplot(2,2,4);
con=convn(Sv,GrayScale)  %for N-Dimention conv
imshow(con)
title('S_V with GrayScale image')



