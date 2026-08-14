% Clear previous data and plots
clc;
clear;
close all;

% Select multiple CSV files using GUI
[fileNames, pathName] = uigetfile('*.csv', 'Select CSV files', 'MultiSelect', 'on');

% Check if multiple files are selected
if iscell(fileNames)
    numFiles = length(fileNames); % Number of files selected
else
    numFiles = 1; % Only one file selected
    fileNames = {fileNames}; % Convert to cell array for consistency
end

% Create figure for smoothed plot
figure;
hold on;

% Specify color and line transparency parameters
color = [33/255, 231/255, 118/255];
numLayers = 10; % Number of layers to simulate transparency
alphaValue = 0.99 / numLayers; % Total alpha ~ 0.5

% Loop through each selected file
for idx = 1:numFiles
    % Read the CSV file
    data = readtable(fullfile(pathName, fileNames{idx}));
    
    % Apply moving average filter to smooth the data
    windowSize = 10; % Adjust as needed
    x_smooth = movmean(data.mmT4_x, windowSize);
    y_smooth = movmean(data.mmT4_y, windowSize);
    
    % Simulate transparency by overlaying multiple semi-transparent lines
    for layer = 1:numLayers
        plot(x_smooth, y_smooth, 'LineWidth', 3.5, 'Color', [color alphaValue]);
    end
end

% Plot a filled purple circle at (0,0)
scatter(0, 0, 100, [130/255, 16/255, 252/255], 'filled');

xlabel('X Coordinate (mm)');
ylabel('Y Coordinate (mm)');

hold off;
xlim([-2.1, 4.6]);
ylim([-3.5, 9.5]);
