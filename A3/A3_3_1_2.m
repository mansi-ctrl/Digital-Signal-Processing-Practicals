
clc;
close all; 
x1=input('Enter x1 :: ');
x2=input('Enter x2 :: ');

% x1=[1 -1 -2 3 -1];
% x2=[1 2 3];

% x1=[1 2 1 2];
% x2=[3 2 1 4];

y_convofunc=circular_convo(x1,x2);

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
title('Circular Conv without inbuilt Function');
xlabel('n');
ylabel('Amplitude');
xticks(1:1:length(y_convofunc));


function ccov=circular_convo(x1, x2)
    if (length(x1) >= length(x2))       
        x1padding=x1;
        x2padding=[x2 zeros(1, length(x1)-length(x2))];
    else
        x2padding=x2;
        x1padding=[x1 zeros(1, length(x2)-length(x1))];
    end
    ccov = ifft(fft(x1padding).*fft(x2padding));  
    ccov = ccov(1:max(length(x1), length(x2)));
end


