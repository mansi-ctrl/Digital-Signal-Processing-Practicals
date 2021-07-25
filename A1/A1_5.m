close all ; % To close all the previous figures
% Use subplot to plot two figures
% x1=[1 -1 2 5 1 5 -1];
% zeroptr1=2;
% shift_value=2;
x1=input( 'Enter x1: ' );
zeroptr1=input( 'Enter index to zero for x1:: ' );
% y2(n)=y1(n+k)
 shift_value=input('Enter shift value: '); % k
% If shift value is positive means shift left by shift_value units
% If shift value is negative means shift right by shift_value units
% If shift value is zero means no shift
x2_length=length(x1)+abs(shift_value);
y1=zeros(1,x2_length);
y2=zeros(1,x2_length);
if shift_value>0
% Plot moves left
y1ptr=shift_value+1;
y2ptr=1;
xptr=1;
for n=1:length(x1)
y1(y1ptr)=x1(xptr);
y2(y2ptr)=x1(xptr);
y1ptr=y1ptr+1;
y2ptr=y2ptr+1;
xptr=xptr+1;
end
elseif shift_value<0
% Plot moves right
y1ptr=1;
y2ptr=-shift_value+1;
xptr=1;
for n=1:length(x1)
y1(y1ptr)=x1(xptr);
y2(y2ptr)=x1(xptr);
y1ptr=y1ptr+1;
y2ptr=y2ptr+1;
xptr=xptr+1;
end
end
zeroptr2=zeroptr1+shift_value;
x=linspace(1-zeroptr2, length(y2)-zeroptr2, length(y2));

subplot(2,1,1);
stem(x, y1, 'rV' , 'linewidth' , 2);

grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'A discrete signal' );
% Plot command to plot the discrete function y1
hold on ;
subplot(2,1,2)
stem(x, y2, 'bX' , 'linewidth' , 1);
% Plot command to plot the discrete function y3
hold on ;
xticks(-x3_left:1:x3_right);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'Time Shifted  of a discrete signal' );