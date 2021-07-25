clc;
close all; 
x1=input('Enter x1(n): ');
x2=input('Enter x2(n): ');

% x1=[1 -1 -2 3 -1];
% x2=[1 2 3];
%  
% x1=[1 2 1 2];
% x2=[3 2 1 4];

    
y_inbuilt=conv(x1,x2);

if (length(x1) >= length(x2))
    [y_convofunc, matrix, x3]=circular_convo(x1,x2);
else
    [y_convofunc, matrix, x3]=circular_convo(x2,x1);
end

subplot(3,1,1);
stem(x1,'fill','r');
hold on;
grid on;
title('Input sequence x1(n)');
xlabel('n');
ylabel('Amplitude');
xticks(1:1:length(x1));

subplot(3,1,2);
stem(x2,'fill','r');
hold on;
grid on;
title('Input sequence x2(n)');
xlabel('n');
ylabel('Amplitude');
xticks(1:1:length(x2));

subplot(3,1,3);
stem(y_convofunc,'fill','r');
hold on;
grid on;
title('Circular Convolution without inbuilt function');
xlabel('n');
ylabel('Amplitude');
xticks(1:1:length(y_convofunc));


function [ccov, matrix, x3]=circular_convo(x1, x2)
    matrix=zeros(length(x1),length(x1));
    matrix(:, 1)=x1;
    for count=2:length(x1)
       arr=circshift(matrix(:, count-1), 1);
       matrix(:,count)=arr;
    end    
    x3=zeros(1, length(x1));
    x3(1,1:length(x2))=x2;
    ccov=transpose(matrix*transpose(x3));
end


