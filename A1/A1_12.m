n= linspace(-15,15);
x1 = (3 .* cos( (n .*  pi) ./ 6)) + (5 .* cos(( 3 .* n .*  pi) ./ 4));
x2 = cos(n./7) .* cos( (n.*pi)./7);
x3 = cos((n.*pi)./6) .* cos( (n.*pi)./9);
x4 = (2.* cos((n.*pi)/4)) - sin((n.*pi)/6) + 3.*cos(((n.*pi)./8)+ (pi./3));


% Create plots
t = tiledlayout(2,2);
nexttile
plot(n,x1)
title('a) 3cos(n\pi/6) +5cos(3n\pi/4)');
xlabel('n')
ylabel('x(n)')

nexttile
plot(n,x2)
title('b) cos(n/7)cos(n\pi/7)');
xlabel('n')
ylabel('x(n)')

nexttile
plot(n,x3)
title('c)  cos(n\pi/6) cos(n\pi/9)');
xlabel('n')
ylabel('x(n)')

nexttile
plot(n,x4)
title('d) 2cos(n\pi/4) - sin(n\pi/6) + 3cos((n\pi/8)+(\pi/3))');
xlabel('n')
ylabel('x(n)')

