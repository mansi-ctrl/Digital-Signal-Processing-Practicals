clc;
close all;                  % To close all the previous figures

subplot(2,1,1);             % To plot the first figure
x=linspace(-15,15);         % Generate a linearly spaced vectors in the given range
y=f(x);                     % Generate the output vector based on the output of the function
plot(x,y, 'linewidth', 1);  % Plot command to plot the continuous function
grid on; % to show the grid lines
xlabel('t'); % Label for x-axis
ylabel('x(t)'); % Label for y-axis
title('Continuous time signal'); % Title of the plot

subplot(2,1,2); % To plot the second figure
stem(x,y, 'linewidth', 1); % the discrete function
grid on; % to show the grid lines
xlabel('n'); % Label for x-axis
ylabel('x(n)'); % Label for y-axis
title('Discrete time signal'); % Title of the plot

% function to plot
function y=f(x)
y=(3*x)./(4+x.^2);
end