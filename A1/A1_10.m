close all ; % To close all the previous figures
% Use subplot to plot two figures
x=-5:0.01:5;
y1=zeros(1, length(x));
y2=zeros(1, length(x));
y3=zeros(1, length(x));
for i=1:length(x)
y1(i)=unit_ramp(x(i));
y2(i)=unit_ramp(x(i)-1);
y3(i)=unit_ramp(x(i)+1);
end
xticks(-5:1:5);
subplot(3,1,1);
stem(x, y1, 'r*' , 'linewidth' , 1);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'Unit ramp signal,y(n)' );
% Plot command to plot the discrete function y1
hold on ;
subplot(3,1,2);
stem(x, y2, 'bX' , 'linewidth' , 1);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'Unit ramp signal,y(n-1)' );
% Plot command to plot the discrete function y2
hold on ;
subplot(3,1,3);
stem(x, y3, 'gV' , 'linewidth' , 1);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'Unit ramp signal,y(n+1)' );
% Plot command to plot the discrete function y3

function z = unit_ramp(x)
if x >= 0
z=x;
else
z=0;
end
end