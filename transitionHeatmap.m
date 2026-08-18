%% Clear existing variables, close all figures, and clear the command window
clear;              % Remove all variables from the workspace
close all;          % Close all open figures
clc;                % Clear the command window


%%
% Specify the file path (update this to your file's actual path)
filePath = 'Transition_Point_XY_Coordinates.xlsx';

% Import data using readtable
data = readtable(filePath);

x = data.x;  
y = data.y;  

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


% Define the grid over which to calculate the density
[xi, yi] = meshgrid(linspace(-5, 8, 100), linspace(-5, 8, 100)); 

% Perform kernel density estimation
kd = ksdensity([x', y'], [xi(:), yi(:)], 'Bandwidth', 0.3); 
kd = reshape(kd, size(xi));

kd = kd / max(kd(:));

% Plotting the results as a heatmap
figure;
imagesc(xi(1,:), yi(:,1), kd);
axis xy;
colormap('hot'); 
clim([0 1]);
colorbar;
xlabel('X (mm)');
ylabel('Y (mm)');

hold on; % Keep the current plot
th = 0:pi/50:2*pi;
xc = 0;
yc = 0;
r = 0.5; 
x_circle = r * cos(th) + xc;
y_circle = r * sin(th) + yc;
fill(x_circle, y_circle, 'w', 'LineWidth', 2);
plot(0, 0, 'bx', 'MarkerSize', 20, 'LineWidth', 2);
hold off;