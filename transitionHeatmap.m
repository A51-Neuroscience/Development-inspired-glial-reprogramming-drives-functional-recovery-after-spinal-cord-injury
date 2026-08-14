%% Clear existing variables, close all figures, and clear the command window
clear;              % Remove all variables from the workspace
close all;          % Close all open figures
clc;                % Clear the command window


%%
% Specify the file path (update this to your file's actual path)
filePath = 'Transition_Point_XY_Coordinates.xlsx';

% Import data using readtable
data = readtable(filePath);

% Assuming 'x' and 'y' are column names in the table, adjust if necessary
x = data.x;  % x-values assumed to be in the 'x' column
y = data.y;  % y-values assumed to be in the 'y' column

% Check for and remove NaN values (missing data)
validIndices = ~isnan(x) & ~isnan(y);
x = x(validIndices);
y = y(validIndices);

x = x';
y = y';

% Displaying the results
disp('x values:');
disp(x);
disp('y values:');
disp(y);

%%
% Data points
% x = [-2.6482, -2.166, -0.88861, -0.93331, -1.1819];
% y = [2.446, 2.7678, 2.9512, 2.422, 5.8144];

% x = [3.3906, 4.2367, 3.4778, 4.5826, 2.8784, 3.0807, 4.4479];
% y = [-0.846, 1.9174, -0.59143, -1.8891, -0.75278, 0.35693, 1.1833];

% Define the grid over which to calculate the density
[xi, yi] = meshgrid(linspace(-5, 8, 100), linspace(-5, 8, 100)); % Update x and y-axis ranges

% Perform kernel density estimation
kd = ksdensity([x', y'], [xi(:), yi(:)], 'Bandwidth', 0.3); % You can adjust the bandwidth
kd = reshape(kd, size(xi));

% Plotting the results as a heatmap
figure;
imagesc(xi(1,:), yi(:,1), kd);
axis xy;
colormap('hot'); % Use heat colors for better visual impact
colorbar;
xlabel('X (mm)');
ylabel('Y (mm)');

% Add an 'X' mark at (0,0) to represent the pellet in blue and larger size
hold on; % Keep the current plot
th = 0:pi/50:2*pi;
xc = 0;
yc = 0;
r = 0.5; % Reduce the radius for a tighter circle
x_circle = r * cos(th) + xc;
y_circle = r * sin(th) + yc;
fill(x_circle, y_circle, 'w', 'LineWidth', 2);
plot(0, 0, 'bx', 'MarkerSize', 20, 'LineWidth', 2);
hold off;