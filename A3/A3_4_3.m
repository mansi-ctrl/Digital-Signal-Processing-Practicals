
clc;
close all; 

N=8;
dn=0.1;
n=0:dn:N-1;

x1=cos((2*pi/N).*n);
x2=sin((2*pi/N).*n);    

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

subplot(3,1,2);
stem(x2,'fill','r');
hold on;
grid on;
title('Input sequence x2(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,3);
stem(n, y_convofunc,'fill','r');
hold on;
grid on;
title('Circular Convolution without inbuilt Function');
xlabel('n');
ylabel('Amplitude');


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


