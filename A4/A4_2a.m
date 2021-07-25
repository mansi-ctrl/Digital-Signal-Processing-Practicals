clc;
close all; % To close all the previous figures;
x=[1 2 3 4]; % Input dicrete signal: x(n)
%N=4; % Number of points N for the transform, representing DFT length
N=8; % Number of points N for the transform, representing DFT length
y_myfunc=dft(x,N); % DFT on x using my own function
y_inbuilt=fft(x,N); % DFT on x using inbuilt MATLAB function fft
% fft function with a single input argument x,
% computes the DFT of the input vector or matrix.
% A second argument N to fft function specifies
% a number of points N for the transform, representing DFT length
% If x is a vector, fft computes the DFT of the vector
% Magnitude of the transformed signal y found using my/inbuilt function
magnitude_myfunc = abs(y_myfunc);
magnitude_inbuilt = abs(y_inbuilt);
% Phase of the transformed signal y found using my/inbuilt function
phase_myfunc = unwrap(angle(y_myfunc));
phase_inbuilt = unwrap(angle(y_inbuilt));
% Frequency vector
f_myfunc = (0:length(y_myfunc)-1)*100/length(y_myfunc);
f_inbuilt = (0:length(y_inbuilt)-1)*100/length(y_inbuilt);
% IFFT of the transformed signal y from x == x
y_inv = ifft(y_myfunc,N);
% Main title of the subplots, mentioning the value of parameter N
%main_title=sprintf('N = %d',N);
%suptitle(main_title);
subplot(3,2,1); % Subplot 1
stem(1:length(x), x,'fill','r');
% Plot command to plot the discrete signal x(n)
hold on;
grid on; % make grid lines on
title('x(n)'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
subplot(3,2,2); % Subplot 2
stem(1:length(y_inv), y_inv,'fill','r');
% Plot command to plot the IFFT of y i.e DFT of x(n)
hold on;
grid on; % make grid lines on
title('IFFT of DFT of x(n)'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude');
subplot(3,2,3); % Subplot 3
stem(f_inbuilt, magnitude_inbuilt, 'fill','r');
% Plot command to plot the magnitude spectrum of
% y(n): DFT of x(n) using the inbuilt function
hold on;
grid on; % make grid lines on
title('DFT of x(n)-InbuiltFunc MagnitudeSpectrum'); % title of the figure
xlabel('f'); % label for x-axis
ylabel('Magnitude'); % label for y-axis
subplot(3,2,4); % Subplot 4
stem(f_myfunc, magnitude_myfunc,'fill','r');
% Plot command to plot the magnitude spectrum of
% y(n): DFT of x(n) using my function
hold on;
grid on; % make grid lines on
title('DFT of x(n)-OwnFunc MagnitudeSpectrum'); % title of the figure
xlabel('f'); % label for x-axis
ylabel('Magnitude'); % label for y-axis
subplot(3,2,5); % Subplot 5
stem(f_inbuilt, phase_inbuilt*180/pi, 'fill','r');
% Plot command to plot the phase spectrum of
% y(n): DFT of x(n) using the inbuilt function
hold on;
grid on; % make grid lines on
title('DFT of x(n)-InbuiltFunc PhaseSpectrum'); % title of the figure
xlabel('f'); % label for x-axis
ylabel('Phase'); % label for y-axis
subplot(3,2,6); % Subplot 6
stem(f_myfunc, phase_myfunc*180/pi,'fill','r');
% Plot command to plot the phase spectrum of
% y(n): DFT of x(n) using my function
hold on;
grid on; % make grid lines on
title('DFT of x(n)-OwnFunc PhaseSpectrum'); % title of the figure
xlabel('f'); % label for x-axis
ylabel('Phase'); % label for y-axis
% My function to find DFT of the input sequence x(n) for N points
function y=dft(x, N)
if nargin < 2
N=length(x);
end
% Declare the output vector after DFT
y=zeros(1, max(N, length(x)));
% Check condition for calculating DFT
if(N < length(x))
error(['Length of DFT should be greater than or equal to' ...
' the input sequence x(n)']);
end
% y(k) = summation from n = 0 to N-1 [x(n)*exp(arg*n*j)]
% where arg = -2*pi*k/N for all k = 0 to N-1, total length of y is N
% Iterate from k = 1 to N to get y(k): actual array indices in MATLAB
for k=1:N
% Since k is from 1 to N, instead of k it be k-1
arg=-2*pi*(k-1)/N;
for n=1:min(N, length(x))
% Since n is from 1 to N, instead of n it be n-1
e_jtheta=exp(arg*(n-1)*1j);
y(k)=y(k)+(x(n)*e_jtheta);
end
end
end