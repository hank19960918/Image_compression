%{ 
1. Question:
Create the array:
x = [0:360];
y1 = sin(x*pi/180);
y2 = cos(x*pi/180);
y3 = tan(x*pi/180);

Create a figure window with a first set of axes with ax1 = subplot(2,1,1)
Change the sine curve to colour red and width 2
Change the cosine curve to a green dashed line with a width of 3
Change the x-axis limits to 0 to 360
Change x-axis tick intervals to 30
Add an axis label to the x-axis
Use the legend function to add a legend showing which line is which.
Add a second axis below the first ax2 = ( subplot(2,1,2) ) and plot the y3 against x in it.
set the x-axis limts and tick intervals to match those in the first axis, and the ylimits to +/- 60 with ticks at intervals of 20.
Add an x-label, and legend for the line.
increase the font size on the axis to 12 point.
set the linewidths of both axes to 2
%}

% {
% 1. solution
%%
clear
clc
close all


x = [0:360];
y1 = sin(x*pi/180);
y2 = cos(x*pi/180);
y3 = tan(x*pi/180);
figure;  
subplot(2, 1, 1);
plot(x, y1, "r", 'LineWidth',2); hold on
plot(x, y2, "g--", 'LineWidth',3); hold off
set(gca, 'linewidth',2);
axis([0,360,-1,1])
xtick = [0:30:360];
set(gca,'XTickMode','manual','XTick',xtick);
xlabel('axis','FontSize',10);
legend('sin(x*pi/180)','cos(x*pi/180)')

subplot(2, 1, 2); plot(x, y3, "r", 'LineWidth',2); 
set(gca, 'linewidth',2);
axis([0,360,-60,60])
xtick = [0:30:360];
set(gca,'XTickMode','manual','XTick',xtick);
set(gca,'FontSize',12);
ytick = [-60:20:60];
set(gca,'YTickMode','manual','YTick',ytick);
xlabel('axis','FontSize',12);
legend('tan(x*pi/180)')
%%

