clc;
close all; % To close all the previous figures;
% % Case 1
% x1=[1 -1 -2 3 -1];
% x2=[1 2 3];
% Case 2
x1=[1 2 1 2];
x2=[3 2 1 4];
% Case 3
% x1=[1 2 3 4];
% n=-1:1:length(x1);
% x2=u(n)-u(n-3);
% ********************* CIRCULAR CONVOLUTION *****************%
N=length(x1)+length(x2)-1;
% Circular convolution of x using my own function
ccirc_myfunc=circular_convolution_myfunc(x1, x2, N);
% Circular Convolution of x using my inbuilt function
ccirc_inbuilt=cconv([x1 zeros(1, max(0,length(x1)-1))], ...
[x2 zeros(1, max(0, length(x2)-1))], N);
% ********************* LINEAR CONVOLUTION *****************%
% APPROACH to find linear convolution using circular convolution:
% Consider two sequences x1(n) of length L and x2(n) of length M.
% The two sequences should be made of equal length by
% appending M-1 zeros to x1(n) and L-1 zeros to x2(n).
% This ensures that it is periodic with a period N.
% In short, the length of both the sequences must be made N,
% that is N=L+M-1 by appending the required no. of zeros to the sequence.
%
% Once the zeros are appended, the N point circular convolution of
% the two sequences gives the linear convolution of the sequence.
% Circular convolution of x using my own function
N=length(x1)+length(x2)-1;
clin_myfunc=circular_convolution_myfunc(x1, x2, N);
% Circular Convolution of x using inbuilt function
clin_inbuilt=cconv([x1 zeros(1, max(0,length(x1)-1))], ...
[x2 zeros(1, max(0, length(x2)-1))], N);
% **************************** PLOTS **************************%
subplot(3,2,1); % Subplot 1
stem(1:1:length(x1), x1,'fill','r');
% Plot command to plot the discrete signal x1(n)
hold on;
grid on; % make grid lines on
title('x1(n)'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
subplot(3,2,2); % Subplot 1
stem(1:1:length(x2), x2,'fill','r');
% Plot command to plot the discrete signal x2(n)
hold on;
grid on; % make grid lines on
title('x2(n)'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
subplot(3,2,3); % Subplot 3
stem(1:1:length(ccirc_inbuilt), ccirc_inbuilt, 'fill','r');
% Plot command to plot the magnitude spectrum of
% y(n): DFT of x(n) using the inbuilt function
hold on;
grid on; % make grid lines on
title('Cirular Convo-InbuiltFunc'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
subplot(3,2,4); % Subplot 4
stem(1:1:length(ccirc_myfunc), ccirc_myfunc,'fill','r');
% Plot command to plot the magnitude spectrum of
% y(n): DFT of x(n) using my function
hold on;
grid on; % make grid lines on
title('Cirular Convo-OwnFunc'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
subplot(3,2,5); % Subplot 5
stem(1:1:length(clin_inbuilt), clin_inbuilt, 'fill','r');
% Plot command to plot the magnitude spectrum of
% y(n): DFT of x(n) using the inbuilt function
hold on;
grid on; % make grid lines on
title('Linear Convo-InbuiltFunc'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
subplot(3,2,6); % Subplot 6
stem(1:1:length(clin_myfunc), clin_myfunc,'fill','r');
% Plot command to plot the magnitude spectrum of
% y(n): DFT of x(n) using my function
hold on;
grid on; % make grid lines on
title('Linear Convo-OwnFunc'); % title of the figure
xlabel('n'); % label for x-axis
ylabel('Amplitude'); % label for y-axis
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
% My function to find circular convolution of the input sequence x(n)
% using inbuilt DFT function
function ccov=circular_convolution_inbuilt(x1, x2, N)
Nmin=length(x1)+length(x2)-1;
if nargin < 2
N=Nmin;
end
if(N < Nmin)
error(['N should be greater than or equal to' ...
' the sum of length of x1 and x2 minus 1']);
end
ccov = ifft(fft(x1, N).*fft(x2, N));
end
% My function to find circular convolution of the input sequence x(n)
% using my own DFT function
function ccov=circular_convolution_myfunc(x1, x2, N)
Nmin=length(x1)+length(x2)-1;
if nargin < 2
N=Nmin;
end
if(N < Nmin)
error(['N should be greater than or equal to' ...
' the sum of length of x1 and x2 minus 1']);
end
ccov = ifft(dft(x1, N).*dft(x2, N));
end
% My own function to find unit step signal from the input vector n
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