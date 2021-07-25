clc;
close all;
filename="sample_sound.wav";
[y, fs]=audioread(filename);                % read the audio file
N = length(y);                              % Length of vector y
fft_y = fft(y,N);                           % Fourier transform of y
magnitude_y = abs(fft_y);                   % Magnitude of the FFT of y
phase_y = unwrap(angle(fft_y));             % Phase of the FFT of y
minf=0;                                     % minimum frequency
maxf=(1-1/N)*fs;                            % maximum frequency
df=fs/N;
f = minf:df:maxf; 
w = 2*pi*f;                                 % omega
f_normalized = f/maxf;                      % Normalized frequency 
t=(0:1:length(y)-1)/fs;            
fprintf("\nThe sampling frequency is %d Hz\n ", fs);
fprintf("\nMinimum frequency is %f Hz and Maximum frequency is %f Hz\n", min(y), max(y));
fprintf("\nNormalized frequency is %f Hz\n",max(f_normalized) );
subplot(3,2,1);
plot(t, y,'r');
hold on;
grid on; 
title('Time Domain Signal'); 
xlabel('n'); 
ylabel('Amplitude'); 

subplot(3,2,2); 
plot(f, magnitude_y,'r');
hold on;
grid on; 
title('Magnitude Spectrum of Signal'); 
xlabel('f'); 
ylabel('Magnitude'); 

subplot(3,2,3); 
plot(f, phase_y*180/pi,'r');
hold on;
grid on; 
title('Phase Spectrum of Signal'); 
xlabel('f'); 
ylabel('Phase'); 

subplot(3,2,4); 
plot(f_normalized, magnitude_y,'r');
hold on;
grid on;
title('Magnitude Spectrum of Signal'); 
xlabel('Normalized frequency');
ylabel('Magnitude'); 

subplot(3,2,5); 
plot(f_normalized, phase_y*180/pi,'r');
hold on;
grid on; 
title('Phase Spectrum of Signal'); 
xlabel('Normalized frequency '); 
ylabel('Phase'); 