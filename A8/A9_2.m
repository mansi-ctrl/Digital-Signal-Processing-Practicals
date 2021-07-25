clc ;
close all ;
clear ;
% Defining Parameters
% order N = 4
% lower cut off frequency wc = 1Hz
% Domain type is s : stop
[b,a] = butter (4, 1,"low", 's');
% converting from low pass filter to high pass filter
% given high cutoff frequency fc = 300Hz, wc =2*pi*fc =600pi
% We get high pass analog filter transfer function coefficients bt and at
fc=300;
wc=2*pi*fc;
[bt, at] = lp2hp (b, a, wc);
% Bilinear transformation:
% We get numerator nume and denominator deno
% with sampling frequency fs=1kHz
fs=10^3;
[nume, deno] = bilinear (bt, at, fs) ;
% Plot the zeros and poles
figure;
zplane (nume,deno);
% Plotting the magnitude of frequency response
% numeD = frequency response for the digital filter
% denoD = angular response for the digital filter
figure;
freqz(nume,deno)