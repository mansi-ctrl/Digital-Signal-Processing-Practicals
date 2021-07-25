clc;
close all; 
n=-1:1:2;
x=u(n)-u(n-3); % Input dicrete signal: x(n)

N=4;                                %length of DFT
%N=8;                               %length of DFT


y_ownFunc=dft(x,N);                 %DFT on x own  function
y_inbuiltFunc=fft(x,N);             %DFT on x own  function fft

%Magnitude
magnitude_ownFunc = abs(y_ownFunc);
magnitude_inbuiltFunc = abs(y_inbuiltFunc);

% Phase 
phase_ownFunc = unwrap(angle(y_ownFunc));
phase_inbuiltFunc = unwrap(angle(y_inbuiltFunc));

%vectorof freq
freq_ownFunc = (0:length(y_ownFunc)-1)*100/length(y_ownFunc);
freq_inbuiltFunc = (0:length(y_inbuiltFunc)-1)*100/length(y_inbuiltFunc);

% IFFT 
y_ifft = ifft(y_ownFunc,N);

subplot(3,2,1); 
stem(n, x,'fill','r');
hold on;
grid on; 
title('x(n)');
xlabel('n'); 
ylabel('Amplitude'); 

subplot(3,2,2); 
stem(1:length(y_ifft), y_ifft,'fill','r');
hold on;
grid on; 
title('IFFT of DFT of x(n)'); 
xlabel('n');
ylabel('Amplitude');

subplot(3,2,3); 
stem(freq_inbuiltFunc, magnitude_inbuiltFunc, 'fill','r');
hold on;
grid on; 
title('DFT of x(n)-InbuiltFunc MagnitudeSpectrum');
xlabel('f'); 
ylabel('Magnitude'); 

subplot(3,2,4); 
stem(freq_ownFunc, magnitude_ownFunc,'fill','r');
hold on;
grid on;
title('DFT of x(n)-OwnFunc MagnitudeSpectrum'); 
xlabel('f'); 
ylabel('Magnitude'); 

subplot(3,2,5); 
stem(freq_inbuiltFunc, phase_inbuiltFunc*180/pi, 'fill','r');
hold on;
grid on; 
title('DFT of x(n)-InbuiltFunc PhaseSpectrum');
xlabel('f'); 
ylabel('Phase'); 

subplot(3,2,6); 
stem(freq_ownFunc, phase_ownFunc*180/pi,'fill','r');
hold on;
grid on;
title('DFT of x(n)-OwnFunc PhaseSpectrum'); 
xlabel('f');
ylabel('Phase'); 

%function for DFT of x(n) for N points
function y=dft(x, N)
    if nargin < 2
        N=length(x);
    end
    y=zeros(1, max(N, length(x)));
    %k,n is from 1 to k,N, instead  of k,n it be k-1,n-1
    for k=1:N
       arg=-2*pi*(k-1)/N;
        for n=1:min(N, length(x))
            ejtheta=exp(arg*(n-1)*1j);
            y(k)=y(k)+(x(n)*ejtheta);
        end
    end
end
%function for unit step signal
function y = u(n)
% y is the unit step signal whose length = length of n
y=zeros(1, length(n));
% Iterate over entire length to calculate y
for i=1:length(n)
% If value of n(i) is greater than 0, y(i)=1
if n(i) >= 0
y(i)=1;
% Else y(i)=0
else
y(i)=0;
end
end
end