%{ 
1. Question 
create a vector x from 0 to 100, which interval is 0.1
let y = x^4 + 2 * x^3 + 3 * x^2 + 4 * x + 5, and put x in to calculate
create a figure to plot the formula,
and mark x label as x, y label as y, and title as y = x^4 + 2 * x^3 + 3 * x^2 + 4 * x + 5

hint: you may need .* or .^ to calculate
%}

%{
% solution
x = [0: 0.1: 100]; 
y = x.^4 + 2 .* x.^3 + 3.*  x.^2 + 4 .* x + 5 
figure
plot(x, y); 
xlabel('x');
ylabel('y');
title('y = x^4 + 2 * x^3 + 3 * x^2 + 4 * x + 5');
%}

