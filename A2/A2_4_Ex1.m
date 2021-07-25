clc;
close all;
x_lower_index=input('Enter the lower index of Unit step signal :');
x_upper_index=input('Enter the upper index of Unit step signal :');
dn=0.01;
xn=x_lower_index:dn:x_upper_index;
x=zeros(1,length(xn));
h=zeros(1,length(xn));
for i=1:length(xn)
x(i)=unit_step(xn(i));
h(i)=x(i);
end

y_lower_index=2*x_lower_index;  %lower index of convoltuion as y 
y_upper_index=2*x_upper_index; %upper index of convoltuion as y 
m=[];
y=[];
subplot(4,1,1)
plot(xn,x,'linewidth' , 2);
hold on;
grid on;
title('u(n) signal');
xlabel('Time');
ylabel('Amplitude');
xticks(x_lower_index:1:x_upper_index);

subplot(4,1,2)
plot(xn,h,'linewidth' , 2);
hold on;
grid on;
title('u(n) signal');
xlabel('Time');
ylabel('Amplitude');
xticks(x_lower_index:1:x_upper_index);

convolution=conv(x,h);          %inbuilt func
yn=y_lower_index:dn:y_upper_index;
subplot(4,1,3)
plot(yn,convolution,'linewidth' , 2);
hold on;
grid on;
title('y(n) signal with inbuilt function');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);
%Matrix creation              %without inbuilt func
%h*x(i)
for i=1:length(x)
    g=h.*x(i);
    m=[m;g];%this sequence store array at new row so one matrix will be formed
end
%summation of diagonal(right) elements an store it into one array
%11 12 13 14 
%21 22 23 24
%31 32 33 34
%r=3,c=4,k=7,diagonal_index_sum=2(1+1 first element) because max we have sum=k 
[r c]=size(m);
k=r+c;
diagonal_index_sum=2;
element=0;
%column and row wise searching for sum=diagonal_index_sum
while(diagonal_index_sum<=k)
    for i=1:r
        for j=1:c
            if((i+j)==diagonal_index_sum)
               element=element+m(i,j);
            end
        end
    end
    diagonal_index_sum=diagonal_index_sum+1;%for next diagonal
    y=[y element];
    element=0;
end
disp(y);
subplot(4,1,4)
plot(yn,y, 'linewidth' , 2);
hold on;
grid on;
title('y(n) signal without inbuilt function');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);

function z = unit_step(x)
if x >= 0
z=1;
else
z=0;
end
end
% 
% function [p,k]=UnitStep(lower_index,dn,upper_index)
%     x=lower_index:dn:upper_index;
%     y=zeros(1,length(x))
%     for i=_
% end