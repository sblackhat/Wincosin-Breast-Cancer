function plotData(iter,values)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure;
%The numbers greater than 30 represent the two hidden layer architectures
x = [[2],[5],[10],[15],[20],[25],[30], [35],[37],[40]];
plot(x,iter, 'k+','LineWidth', 2, ...
'MarkerSize', 7);
figure;
hold on;
plot(x', values, 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);
title('Mean test perfomance by architecture');
xlabel('Number of neurons in hidden layer');
ylabel('Mean test performance');
hold off;
% =========================================================================


end

