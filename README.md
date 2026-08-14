# Development-Inspired Glial Reprogramming Drives Functional Recovery after Spinal Cord Injury

This repository contains the source code required to reproduce the kinematic analyses of the fingertip (T4) trajectories (Figs. 7H and S9A) and transition-point heatmaps (Figs. 7I and S9B) presented in the publication, “Development-Inspired Glial Reprogramming Drives Functional Recovery after Spinal Cord Injury.”

The code was developed by Ahnsei Shon, Ph.D., at the Kentucky Spinal Cord Injury Research Center, University of Louisville.

## Transition-Point Heatmap

Place `transitionHeatmap.m` and `Transition_Point_XY_Coordinates.xlsx` in the same folder. Run `transitionHeatmap.m` in MATLAB. The code automatically loads and processes the coordinate data and generates the transition-point heatmap.

To use your own data, replace the coordinate values in `Transition_Point_XY_Coordinates.xlsx` while retaining the existing column names and file structure.

## Trajectory Plot

Run trajectoryPlot.m in MATLAB. A file-selection window will open, allowing you to select multiple CSV files simultaneously.

To reproduce the example trajectory plot, select all files from Example_Trial_01.csv through Example_Trial_10.csv. You may also select your own CSV files. The input files must retain the same data structure and include columns named mmT4_x and mmT4_y.
