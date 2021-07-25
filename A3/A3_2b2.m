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

%Sharpen 3x3 kernel
subplot(1,2,1);
S=zeros(3,3)
S(1,:)=[0 -1 0]; 
S(2,:)=[-1 5 -1];
S(3,:)=[0 -1 0];  
con=convn(S,image)  %for N-Dimention conv
imshow(con)
title('Sharpen Kenel conv with Original image')
subplot(1,2,2);
con=convn(S,GrayScale)  %for N-Dimention conv
imshow(con)
title(' with GrayScale image')



