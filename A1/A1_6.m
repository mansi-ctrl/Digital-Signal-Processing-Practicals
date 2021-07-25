clc;
close all ; % To close all the previous figures
% Use subplot to plot two figures
% x1=[1 -1 2 5 1 5 -1];
% zeroptr1=2;
x1=input( 'Enter x1: ' );
zeroptr1=input( 'Enter index to zero for signal 1: ' );
% y2(n)=y1(-n)
x1_right=length(x1)-zeroptr1;
x1_left=zeroptr1-1;
y2_right_left=max(x1_right,x1_left);
y2_length=2*y2_right_left+1;
y1=zeros(1,y2_length);
y2=zeros(1,y2_length);
zeroptr2=max(x1_right,x1_left)+1;
y1ptr=zeroptr2+1;
y2ptr=zeroptr2-1;
xptr=zeroptr1+1;
for n=1:x1_right
fprintf( "\nxptr=%d, y1ptr = %d, y2ptr = %d " , xptr, y1ptr, y2ptr);
y1(y1ptr)=x1(xptr);
y2(y2ptr)=x1(xptr);
y1ptr=y1ptr+1;
y2ptr=y2ptr-1;
xptr=xptr+1;
end
y1ptr=zeroptr2-1;
y2ptr=zeroptr2+1;
xptr=zeroptr1-1;
for n=1:x1_left
fprintf( "\nxptr=%d, y1ptr = %d, y2ptr = %d " , xptr, y1ptr, y2ptr);
y1(y1ptr)=x1(xptr);
y2(y2ptr)=x1(xptr);
y1ptr=y1ptr-1;
y2ptr=y2ptr+1;
xptr=xptr-1;
end
y1(zeroptr2)=x1(zeroptr1);
y2(zeroptr2)=x1(zeroptr1);

x=linspace(-max(x1_left, x1_right), max(x1_left, x1_right), length(y2));

subplot(2,1,1)
stem(x, y1, 'rV' , 'linewidth' , 2);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'A discrete signal y1(n)' );
% Plot command to plot the discrete function y1
hold on ;

subplot(2,1,2)
stem(x, y2, 'bX' , 'linewidth' , 1);

grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'Signal folded of a discrete signal ,y2(n)=y1(-n)' );
% Plot command to plot the discrete function y3
hold on ;
xticks(-y2_right_left:1:y2_right_left);