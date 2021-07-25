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

%Edge detection kernel
subplot(2,3,1);
E=zeros(3,3)
E(1,:)=[0 -1 0]; 
E(2,:)=[-1 4 -1];
E(3,:)=[0 -1 0];  
con=convn(E,image)  %for N-Dimention conv
imshow(con)
title('E with Original image')
%E_h
subplot(2,3,2);
Eh=zeros(3,3)
Eh(1,:)=[0 0 0]; 
Eh(2,:)=[-1 2 -1];
Eh(3,:)=[0 0 0];  
con=convn(Eh,image)  %for N-Dimention conv
imshow(con)
title('E_H with Original image')
%E_v
subplot(2,3,3);
Ev=zeros(3,3)
Ev(1,:)=[0 -1 0]; 
Ev(2,:)=[0 2 0];
Ev(3,:)=[0 -1 0];  
con=convn(Ev,image)  %for N-Dimention conv
imshow(con)
title('E_V with Original image')
%with grayscale image
subplot(2,3,4);
con=convn(E,GrayScale)  %for N-Dimention conv
imshow(con)
title('E with GrayScale image')

subplot(2,3,5);
con=convn(Eh,GrayScale)  %for N-Dimention conv
imshow(con)
title('E_H with GrayScale image')

subplot(2,3,6);
con=convn(Ev,GrayScale)  %for N-Dimention conv
imshow(con)
title('E_V with GrayScale image')



