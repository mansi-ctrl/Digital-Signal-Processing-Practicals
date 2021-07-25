clc;
clear all;

% The original image
subplot(1,3,1); 
image=imread("lenna.png"); % reads an image file
imshow(image); % display the image in the graphics file with filename=image
title('Original Image'); % title of the figure

% Scaling to gray
subplot(1,3,2); % Subplot 2
GrayScale=rgb2gray(image); % . The rgb2gray function converts RGB images to grayscale by eliminating the hue and saturation information while retaining the luminance
imshow(GrayScale); % display the image in the graphics file with filename=G
title('Gray Scale ');

%average(blur,smooth)
%subplot(1,3,3);
A=zeros(3,3)
A(1,:)=[1/9 1/9 1/9]; 
A(2,:)=[1/9 1/9 1/9]; 
A(3,:)=[1/9 1/9 1/9]; ; 
%con=convn(A,image)  %for N-Dimention conv
%imshow(con,[]);
%title('Average(blur,smooth) Kenel conv with Original image')
subplot(1,3,3);
con=convn(A,GrayScale)  %for N-Dimention conv
imshow(con,[]);
title('A conv with GrayScale image')
