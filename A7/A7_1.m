clc ;
close all ;
clear ;
%impz(b,a,n) with no output arguments plots the impulse response of the digital filter with numerator coefficients b and denominator coefficients a.
%b :: coefficients of numerator part as [...b4(Z^4) b3(Z^3) b1(Z^2) b1(Z^1) b0(Z^0) b(-1)(Z^-1) b(-2)(Z^-2) b(-3)(Z^-3) ..]
%a :: coefficients of denominator part as [...b4(Z^4) b3(Z^3) b1(Z^2) b1(Z^1) b0(Z^0) b(-1)(Z^-1) b(-2)(Z^-2) b(-3)(Z^-3) ..]
b=[0 0.116 0.0715];
a=[1 -1.6014 1.0211 -0.2321];
figure(1)
impz(b,a)

%freqz function : freqz(b,a,n,fs) without output argument,Display the magnitude and phase responses of the filter.
%b=numerator coefficients
%a=denomerator coefficients
%(optional)n=Number of evaluation points, specified as a positive integer scalar no less than 2. When n is absent, it defaults to 512. For best results, set n to a value greater than the filter order.
%fs=sampling freq
fs=8000;
figure(2)
freqz(b,a,fs);
