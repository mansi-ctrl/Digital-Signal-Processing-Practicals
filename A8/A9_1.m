clc ;
close all ;
clear ;
%impz(b,a,n) with no output arguments plots the impulse response of the digital filter with numerator coefficients b and denominator coefficients a.
%b :: coefficients of numerator part as [...b4(Z^4) b3(Z^3) b1(Z^2) b1(Z^1) b0(Z^0) b(-1)(Z^-1) b(-2)(Z^-2) b(-3)(Z^-3) ..]
%a :: coefficients of denominator part as [...b4(Z^4) b3(Z^3) b1(Z^2) b1(Z^1) b0(Z^0) b(-1)(Z^-1) b(-2)(Z^-2) b(-3)(Z^-3) ..]
%n(optional):: number of samples 
b=[0.1067 -0.4267 0.64 -0.4266 0.1067];
a=[1 -0.1467 0.4931 -0.03112 0.018184];
%n=1131;% as it's optional i take my rollnumber last two digit

%freqz function : freqz(b,a,n,fs) without output argument,Display the magnitude and phase responses of the filter.
%b :: numerator coefficients
%a :: denomerator coefficients
%(optional)n :: Number of evaluation points, specified as a positive integer scalar no less than 2. When n is absent, it defaults to 512. For best results, set n to a value greater than the filter order.
%fs :: sampling freq
fs=1000;
figure(1)
freqz(b,a,fs);
title('By hand Written')



