function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   (Beningn) and o yellow for the negative examples(Malign). 
%    X is assumed to be at least an Mx2 matrix.
%    We used these attributes because they were quite representative and 
%    can gave us a representatin in 2 dim of the dataset

% Create New Figure
figure; hold on;

pos = find(y==1);
neg = find(y==0);
plot(X(1,pos), X(9,pos), 'k+','LineWidth', 2, ...
'MarkerSize', 7);
plot(X(1,neg), X(9,neg), 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);
title('Distribution of the cases depending on the radius and symmety of the cells')
xlabel('Radius of the cell');
ylabel('Symmetry of the cell');
legend({'beningn cases','malign cases'});



% =========================================================================



hold off;

end
