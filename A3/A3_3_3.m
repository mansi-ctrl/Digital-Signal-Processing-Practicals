
clc;
close all; 
N=8;
dn=0.1;
n=0:dn:N-1;

x1=cos((2*pi/N).*n);
x2=sin((2*pi/N).*n);    
   
y_convofunc=circular_convo(x1,x2);

subplot(3,1,1);
stem(x1,'fill','r');
hold on;
grid on;
title('Input sequence x1(n) ');
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
title('Circular Conv without inbuilt Function');
xlabel('n');
ylabel('Amplitude');


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




