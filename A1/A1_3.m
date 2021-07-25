clc;
close all ; % To close all the previous figures
% Use subplot to plot two figures
% x1=[1 -1 2 5 1 5 -1];
% x2=[-2 -8 9 4 2 3 5];
% zeroptr1=2;
% zeroptr2=1;
x1=input( 'Enter x1:: ' );
zeroptr1=input( 'Enter index to zero for signal 1:: ' );
x2=input( 'Enter x2:: ' );
zeroptr2=input( 'Enter index to zero for signal 2:: ' );

x3_left=max(zeroptr1-1, zeroptr2-1); % total elements to the left of zero
x3_right=max(length(x1)-zeroptr1, length(x2)-zeroptr2);
% total elements to the right of zero
x3_length=x3_left+x3_right+1;
% total elements of the final array x3 or y3
y1=zeros(1,x3_length); % new vector with zeros padded to x1
y2=zeros(1,x3_length); % new vector with zeros padded to x2
% inserting values to y1 vector from x1
yptr=max(1, zeroptr2-zeroptr1+1);
xptr=1;
for n=1:length(x1)
y1(yptr)=x1(xptr);
yptr=yptr+1;
xptr=xptr+1;
end
% inserting values to y2 vector from x2
yptr=max(1, zeroptr1-zeroptr2+1);
xptr=1;
for n=1:length(x2)
y2(yptr)=x2(xptr);
yptr=yptr+1;
xptr=xptr+1;
end
y3=y1+y2; % output vector y3 is sum of y1 and y2.
% Note that the length of y1, y2 and y3 is same Output:
zeroptr3=max(zeroptr1, zeroptr2);
x=linspace(-x3_left, x3_right, x3_length); % index of vectors y1, y2, y3
subplot(3,1,1);
stem(x, y1, 'b*' , 'linewidth' , 2);
grid on ;
xlabel( 'time' );
ylabel( 'Signal Amplitude' );
title( 'x_1' );
% Plot command to plot the discrete function y1
hold on ;
subplot(3,1,2);
stem(x, y2, 'ro' , 'linewidth' , 2);
grid on ;
xlabel( 'time' );
ylabel( 'Signal Amplitude' );
title( 'x_2' );
% Plot command to plot the discrete function x2
hold on ;

subplot(3,1,3);
stem(x, y3, 'gX' , 'linewidth' , 2);
grid on ;grid on ;
xlabel( 'time' );
ylabel( 'Signal Amplitude' );
title( 'Addition of discrete signals' );
% Plot command to plot the discrete function y3
hold on ;

xticks(-x3_left:1:x3_right);

%legend( 'y1(n)' , 'y2(n)' , 'y3(n)=y1(n)+y2(n)' );