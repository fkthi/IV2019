%% ====================================================
% F. Kruber, 28th April 2019
% Version 1.0
%% ====================================================


%______________________________________________________
%% DESCRIPTION

% This script calls the functions to plot the clustered scenarios from the
% IEEE IV 2019 paper: 
%   Unsupervised and Supervised Learning with the Random Forest Algorithm for 
%   Traffic Scenario Clustering and Classification

% Following options are available:
%   1) DesiredType: Choose either to plot the inital clusters from the URF
%       clustering process or the scenarios which got assigned from the RF
%       classifier
%   2) plotCluster: Choose which cluster to plot
%   3) pauseValue: Choose the delay between each frame in milliseconds
%   4) DesiredMaxWindow: maximize the plot figure (R2018a and later
%       supported)

% Further description of each variable is given below.

% Known issues:
%   1) Due to the lane index logic, vehicles might sometimes overlap
%   slightly without being recognized as an accident, as they are
%   considered being on the neighbouring lane already.

%______________________________________________________
%% CLEAR WORKSPACE AND COMMAND WINDOW

clear;clc;


%______________________________________________________
%% CHOOSE PLOT:
% DesiredType = 1 : Plot Scenario Clusters from unsupervised clustering result (see section 5 in paper)
% DesiredType = 2 : Plot Scenarios Clusters from classification result (see section 6 in paper)

DesiredType = 1; % DesiredType = 1  OR DesiredType = 2


%______________________________________________________
%% CHOOSE WHICH CLUSTER TO PLOT
% Choose any Cluster from 1 to 100. Alternatively, choose 101 to get all
% 100 clusters re-played in one sequence

plotCluster = 5; % plotCluster = 101 will plot all scenarios from all clusters successively


%______________________________________________________
%% CHOOSE DELAY BETWEEN EACH FRAME
% A proper delay value varies due to CPU performance.
% The value given here is in milliseconds. The default value is 5 ms. 
% The delay value is restricted from 1 ms to 100 ms.

pauseValue = 5; % choose between 1 ... 100 [ms]

%______________________________________________________
%% Check Matlab Version 
% Built-In function for maximizing figure window is released with R2018a (9.4).
% If older Matlab Version installed, the plot window will not be maximized
% It is recommended to maximize the window then manually during the playback.
% Tested on R2017b, R2018a, R2019a

DesiredMaxWindow = 1; %to switch off: DesiredMaxWindow = 0;
MatlabVersion = verLessThan('matlab', '9.4'); %checks if Matlab Version is R2018a or newer

%______________________________________________________
%% CALL PLOT FUNCTIONS AND START PLOTTING

plotClusters(DesiredType, plotCluster, pauseValue, DesiredMaxWindow, MatlabVersion)



