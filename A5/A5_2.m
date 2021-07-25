clear all;
clc;

z=[0;1/12];
p=[1/2;-1/3];
figure(1);
zplane(z,p);
title('Zeros and Poles of X(n)=(1/2)^nu(n) + (-1/3)^nu(n) ');

z=[0];
p=[1/2;-1/3];
figure(2);
zplane(z,p);
title('Zeros and Poles of X(n)=(-1/3)^nu(n) - (1/2)^nu(-n-1) ');

z=[inf];
p=[1/2];
figure(3);
zplane(z,p);
title('Zeros and Poles of X(n)=(1/2)^nu(-n) ')

z=[0];
p=[1;-1];   
figure(4);
zplane(z,p);
title('Zeros and Poles of X(n)=\{-1,0,-1,0,-1,0,-1,0,...\}')

