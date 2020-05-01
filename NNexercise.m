%% First we load the values of our ANN 
%  The values are stored in base.xlsx file 
%% Initialization
clear ; close all; clc

%% Setup the parameters 
input_layer_size   = 569;  % 569 examples of patients 
iterations         = 50;   % Number of iterations applied to each architecture
optIter = zeros(iterations,1); % Store the best epoch for each architecture
values  = zeros(iterations,1); % Store the best test result for each architecture
%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

X = xlsread('breastCancerData.xlsx','ANN inputs')';
y = xlsread('breastCancerData.xlsx','ANN outputs')';
m = size(X, 2); %Number of training examples

%Funciton to display the dataset
displayData(X,y); %Print it as a function of the radius and symmetry
 
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ========== Part 2 : Setting up the architecture ==============
% Set up the different architectures we are going to test
architectures = {[2],[5],[10],[15],[20],[25], [30], [3 2],[4 3],[10 5]};
%Set how the training set is distributed
trainRatio = 0.65; % training
valRatio = 0.2; % validation
testRatio = 0.25; % test
%% ========== Part 3 : Running and checking the results for 1 input layer=========
[optIter, values] = CheckArchitectures(architectures,X,y, iterations, ...
    trainRatio,valRatio,testRatio);
fprintf('Program paused. Press enter to continue.\n');
pause;

%%  ======== Part 4 : Plot the results ==========
plotData(optIter,values);
pause;
