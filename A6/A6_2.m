clc;
close all ; 

fC=1/12;

x_lower_index=input('Enter the lower index signal :');
x_upper_index=input('Enter the upper index signal :');
dn=0.01;
xn=x_lower_index:dn:x_upper_index;
Hn_LowPass=zeros(1,length(xn));
Hn_HighPass=zeros(1,length(xn));
Xn=zeros(1,length(xn));
for i=1:length(xn)
    Hn_LowPass(i)=2*fC*sinc(2*fC*xn(i));
    Hn_HighPass(i)=sinc(xn(i))-2*fC*sinc(2*fC*xn(i));
    Xn(i)=(10*cos(2*pi*xn(i)/20))+(5*cos(2*pi*xn(i)/8));
end

y_lower_index=2*x_lower_index;  %lower index of convoltuion as y 
y_upper_index=2*x_upper_index; %upper index of convoltuion as y 

subplot(3,1,1)
plot(xn,Xn,'linewidth' , 2);
hold on;
grid on;
title('x(n)=10*cos(2*pi*n/20)+5*cos(2*pi*n/8)signal');
xlabel('Time');
ylabel('Amplitude');
xticks(x_lower_index:1:x_upper_index);

%low pass Filter----------------------------------------------------------
m=[];
y=[];
yn=y_lower_index:dn:y_upper_index;
%Matrix creation              %without inbuilt func
%h*x(i)
for i=1:length(Xn)
    g=Hn_LowPass.*Xn(i);
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
subplot(3,1,2)
plot(yn,y, 'linewidth' , 2);
hold on;
grid on;
title('y(n)=x(n)*h(n) of low pass Filter');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);


%high pass Filter----------------------------------------------------------
m=[];
y=[];
yn=y_lower_index:dn:y_upper_index;
%Matrix creation              %without inbuilt func
%h*x(i)
for i=1:length(Xn)
    g=Hn_HighPass.*Xn(i);
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
subplot(3,1,3)
plot(yn,y, 'linewidth' , 2);
hold on;
grid on;
title('y(n)=x(n)*h(n) of high pass Filter');
xlabel('Time');
ylabel('Amplitude');
xticks(y_lower_index:1:y_upper_index);