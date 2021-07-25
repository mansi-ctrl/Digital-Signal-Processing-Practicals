f = 2000; % frequnecy 2 kHZ
time = -10:0.01:10; % range
x1 = sin (2* pi*f/10000*time); %Signal 1 at fs = 10,000
subplot (2,1,1);
plot (time ,x1) % period 10000/2000=5
xlabel ( 'Time' );
ylabel ( 'Amplitude' );
title ( 'Signal at sampling frequency = 100000 and freq=2000' )
x2 = sin (2* pi*f/3000*time); %Signal 2 at fs = 3000
subplot (2,1,2);
plot (time ,x2) % period 3000/2000 = 1.5
xlabel ( 'Time' );
ylabel ( 'Amplitude' );
title ( 'Signal at sampling frequency = 3000 and freq=2000' )