amplitude = input('Enter the amplitude:: ');
freq= input('Enter the frequency:: ');
phase = input(' Enter the phase:: ');
sampling = input('Enter the sampling frequency:: ');

t=(-1/freq:1/(sampling):1/freq);

X= 2*pi*freq*t+ phase
wave= amplitude*sin(X);
subplot(2,1,1);
plot(t,wave,'LineWidth',1.5);
title('Continuous signal');
xlabel('time')
ylabel('amplitude')

subplot(2,1,2)
stem(t,wave,'LineWidth',1.5);
title('Discrete signal');
xlabel('time')
ylabel('amplitude')