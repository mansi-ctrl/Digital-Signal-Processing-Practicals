clc;
close all ; 

fC=1/6;
fL=1/9;
fH=1/3;
n=linspace(-20, 20);

hn_low=2*fC*sinc(2*fC*n);
hn_high=sinc(n)-2*fC*sinc(2*fC*n);
hn_bandpass=(2*fH*sinc(2*fH*n))-(2*fL*sinc(2*fL*n));
hn_bandstop=(2*fL*sinc(2*fL*n))-(2*fH*sinc(2*fH*n));

sgtitle('Impluse response of filters ')
subplot(2,2,1)
plot(n, hn_low);
grid on;
xlabel('n');
ylabel('H(n)');
title("Low Pass Filter")
subplot(2,2,3)
plot(n, hn_high);
grid on;
xlabel('n');
ylabel('H(n)');
title("High Pass Filter")
subplot(2,2,2)
plot(n, hn_bandpass);
grid on;
xlabel('n');
ylabel('H(n)');
title("Band Pass Filter")
subplot(2,2,4)
plot(n, hn_bandstop);
grid on;
xlabel('n');
ylabel('H(n)');
title("Band Stop Filter")