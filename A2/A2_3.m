%Auto corr y(n)=x(n)*x(-n)
clc
clear all
close all
x=input('Enter the first array x(n) :');
xptr=input('Enter index of zero pointer x(n) :');
%h=input('Enter the second array h(n) :');
%hptr=input('Enter index of zero pointer h(n) :');
%n2=input('Enter the time sample range:');
h=x;
hptr=xptr;
x_lower_index=1-xptr;
x_upper_index=length(x)-xptr;
h_lower_index=1-hptr;
h_upper_index=length(h)-hptr;
%n2=-fliplr(n2);
dummy=h_lower_index;
h_lower_index=-h_upper_index
h_upper_index=abs(dummy)
z=[];
h=fliplr(h);
y_lower_index=x_lower_index+h_lower_index;
y_upper_index=x_upper_index+h_upper_index;
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
title('x(-n) signal');
xlabel('Time');
ylabel('Amplitude');
xticks(h_lower_index:1:h_upper_index);

convolution=xcorr(x,h);
%NEED TO DO PADDING FOR XCORR()
subplot(4,1,3)
stem(y_lower_index:y_upper_index,convolution,'linewidth' , 2);
hold on;
grid on;
title('y(n) signal with inbuilt function');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);

for i=1:length(x)
    g=h.*x(i);
    z=[z;g];
end
[r c]=size(z);
k=r+c;
t=2;
y=[];
cd=0;
while(t<=k)
    for i=1:r
        for j=1:c
            if((i+j)==t)
               cd=cd+z(i,j);
            end
        end
    end
    t=t+1;
    y=[y cd];
    cd=0;
end


subplot(4,1,4)
stem(y_lower_index:y_upper_index,y,'linewidth' , 2);
hold on;
grid on;
title('y(n) signal without inbuilt function');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);

display(y);