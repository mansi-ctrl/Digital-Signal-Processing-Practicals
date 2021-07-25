clc;
close all; 

% The original image
subplot(1,2,1); 
image=imread("lenna.png"); % reads an image file
imshow(image); % display the image in the graphics file with filename=image
title('Original Image'); % title of the figure

% Scaling to gray
subplot(1,2,2); % Subplot 2
GrayScale=rgb2gray(image); % . The rgb2gray function converts RGB images to grayscale by eliminating the hue and saturation information while retaining the luminance
imshow(GrayScale); % display the image in the graphics file with filename=G
title('Gray Scale of Original Image');
