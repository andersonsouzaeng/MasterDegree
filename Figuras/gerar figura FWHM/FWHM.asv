clear; clc;

x = [0:10]; x=x';
y = [1 1 2 3 7 12 7 3 2 1 1]; y=y';
[fittedmodel, goodness, output] = fit(x,y,'gauss1');

x_ax = 0:0.01:10;
y_fitted = fittedmodel(x_ax); % provides all the fitted values for the specified x-axis
max_y_fitted = max(y_fitted);

plot(x_ax,y_fitted,'k','LineWidth',2);
grid;

x = find (y_fitted > max_y_fitted/2);
x1 = x_ax(x(1));
x2 = x_ax(x(end));

line ([x1 x2], [max_y_fitted/2 max_y_fitted/2],'LineWidth', 4,  'Color', 'k');
line ([x1 x1], [max_y_fitted/2 0],'LineWidth', 1, 'LineStyle', '--',  'Color', 'k');
line ([x2 x2], [0 max_y_fitted/2 ],'LineWidth', 1, 'LineStyle', '--',  'Color', 'k');

xlabel();
