clc;
close all ; % To close all the previous figures
% Use subplot to plot two figures
% x1=[1 -1 2 5 1 5 -1];
% zeroptr1=2;
x1=input( 'Enter x1:: ' );
zeroptr1=input( 'Enter index to zero for x1:: ' );
multipler=input('Enter value of multipler:: ');
x2=zeros(1,length(x1))
x1_right=length(x1)-zeroptr1;
x1_left=zeroptr1-1;
x=linspace(-max(x1_left, x1_right), max(x1_left, x1_right), length(x1));

for n=1:length(x1)
    x2(n)=multipler.*x1(n);
end


subplot(2,1,1)
stem(x, x1, 'rV' , 'linewidth' , 2);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'A discrete signal ' );
% Plot command to plot the discrete function y1
hold on ;
subplot(2,1,2)
stem(x, x2, 'b*' , 'linewidth' , 2);
grid on ;
xlabel( 'Time' );
ylabel( 'Signal Amplitude' );
title( 'A discrete multiplied signal ' );
% Plot command to plot the discrete function y1
hold on ;

