close all;
clear all;
clc;

z=[0];
p=[1/2;1/4];
figure(1);
zplane(z,p);
title('Zeros and Poles of H(Z)= Z^{2}/(Z-0.25)(Z-0.5) ');

z=[0];
p=[1];
figure(2);
zplane(z,p);
title('Zeros and Poles of H(Z)= Z/(Z-1) ');

z=[-1/sqrt(2);1/sqrt(2)];
p=[1/2;1/5];
figure(3);
zplane(z,p);
title('Zeros and Poles of H(Z)= (2Z^{2}-1)/(Z-0.5)(Z-0.2) ');

b=[1];
a=[1 -0.75 0.125];
figure(4);
impz(b,a,16);
title('Impulse Response of H(Z)= 1/( 1-0.75Z^{-1}+0.125Z^{-2} ) ');

b=[1];
a=[1 -1];
figure(5);
impz(b,a,16);
title('Impulse Response of H(Z)= 1/( 1-Z^{-1} ) ');

b=[2 0 -1];
a=[1 -0.7 0.1];
figure(6);
impz(b,a,16);
title('Impulse Response of H(Z)= (2-1Z^{-2})/( 1-0.7Z^{-1}+0.1Z^{-2} ) ');

