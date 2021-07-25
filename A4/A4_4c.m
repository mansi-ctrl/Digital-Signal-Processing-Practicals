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
% Signal + Noise
noise=0.5*cos(2*pi*2*t);
yn=zeros(1, length(y)); 
for idx=1:length(t)
    yn(idx)=y(idx)+noise(idx);
end
filename="sample_sound_with_noise_addition.wav";
audiowrite(filename, yn, fs); % Saving the noisy audio
[yn, fsn]=audioread(filename); % read the noisy audio file
[b,a] = butter(3, [0.3 0.7],'bandpass');
% butter function returns the transfer function coefficients
% of an n th-order lowpass digital Butterworth filter. Here n = 3
y_filtered=filter(b, a, yn); % filtering the noisy signal
% Writing the filtered signal into the audio file
audiowrite("sample_sound_filtered.wav", y_filtered, fsn);

fprintf("\nThe sampling frequency is %d Hz\n", fs);
fprintf("\nMinimum frequency is %f Hz and Maximum frequency is %f Hz\n", min(y), max(y));
subplot(2,2,1);
plot(t, y,'r');
hold on;
grid on; 
title('Time Domain Signal'); 
xlabel('n'); 
ylabel('Amplitude'); 

subplot(2,2,2); 
plot(t, noise,'r');
hold on;
grid on; 
title('Noise Signal'); 
xlabel('n'); 
ylabel('Amplitude'); 

subplot(2,2,3); 
plot(t, yn,'r');
hold on;
grid on;
title('Original + noise ');
xlabel('n'); 
ylabel('Amplitude'); 

subplot(2,2,4); 
plot(t, y_filtered,'r');
hold on;
grid on; 
title('Signal after filtering');
xlabel('n'); 
ylabel('Amplitude'); 