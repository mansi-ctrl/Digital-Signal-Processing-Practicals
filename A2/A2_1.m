%linear y(n)=x(n)*h(n)
clc;
close all;
x=input('Enter the first array x(n) :');
xptr=input('Enter index of zero pointer x(n) :');
h=input('Enter the second array h(n) :');
hptr=input('Enter index of zero pointer h(n) :');
% -2 -1 0 1 2 3 so -2:3
% 0 1 2 3 so 0:3
%-2:6
x_lower_index=1-xptr;
x_upper_index=length(x)-xptr;
h_lower_index=1-hptr;
h_upper_index=length(h)-hptr;
y_lower_index=x_lower_index+h_lower_index;
y_upper_index=x_upper_index+h_upper_index;
z=[];
y=[];
subplot(4,1,1)
stem(x_lower_index:x_upper_index,x,'linewidth' , 2);
hold on;
grid on;
title('x(n) signal');
xlabel('Time');
ylabel('Amplitude');
xticks(x_lower_index:1:x_upper_index);

subplot(4,1,2)
stem(h_lower_index:h_upper_index,h,'linewidth' , 2);
hold on;
grid on;
title('h(n) signal');
xlabel('Time');
ylabel('Amplitude');
xticks(h_lower_index:1:h_upper_index);

convolution=conv(x,h);

subplot(4,1,3)
stem(y_lower_index:y_upper_index,convolution,'linewidth' , 2);
hold on;
grid on;
title('y(n) signal with inbuilt function');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);
%Matrix creation
%h*x(i)
for i=1:length(x)
    g=h.*x(i);
    z=[z;g];        %this sequence store array at new row so one matrix will be formed
end
%summation of diagonal(right) elements an store it into one array
%11 12 13 14 
%21 22 23 24
%31 32 33 34
%r=3,c=4,k=7,diagonal_index_sum=2(1+1 first element) beacuse max we have sum=k 
[r c]=size(z);
k=r+c;
diagonal_index_sum=2;
element=0;
%column and row wise searching for sum=diagonal_index_sum
while(diagonal_index_sum<=k)
    for i=1:r
        for j=1:c
            if((i+j)==diagonal_index_sum)
               element=element+z(i,j);
            end
        end
    end
    diagonal_index_sum=diagonal_index_sum+1;    %for next element
    y=[y element];
    element=0;
end
disp(y);
subplot(4,1,4)
stem(y_lower_index:y_upper_index,y, 'linewidth' , 2);
hold on;
grid on;
title('y(n) signal without inbuilt function');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);
