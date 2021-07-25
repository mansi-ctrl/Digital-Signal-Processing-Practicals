
n = linspace(-10,10);
x1=cos(0.002.*pi.*n);
x2=sin(30.*pi.*n./105)
x3=sin(5.*n)
x4=cos(32.*pi.*n./10)
x5=10.*cos((7.*n )+(pi./6))
x6=2.*exp(1j.*(n-pi))

t=tiledlayout(3,3);

nexttile
plot(n,x1)
title('a) cos(0.002\pin)')
xlabel('n')
ylabel('x(n)')
nexttile
plot(n,x2)
title('b) sin(30\pin/105)')
xlabel('n')
ylabel('x(n)')
nexttile
plot(n,x3)
title('c) sin(5n)')
xlabel('n')
ylabel('x(n)')
nexttile
plot(n,x4)
title('d) cos(32\pin/10)')
xlabel('n')
ylabel('x(n)')
nexttile
plot(n,x5)
title('e) 10 cos(7n+\pi/6)')
xlabel('n')
ylabel('x(n)')
nexttile
plot(n,x6)
title('f) 2e^{j(n-\pi)}')
xlabel('n')
ylabel('x(n)')