%% ====================================================
% F. Kruber, 28th April 2019
% Version 1.0
%% ====================================================


%______________________________________________________
%% GENERAL DESCRIPTION
% These 47 features are extracted from each scenario for the clustering and
% classification process. The names are arranged in a cell, so that one can
% use the names ordered in the same structure as the dataset for analysis purposes.

% IEEE IV 2019 paper: 
%   Unsupervised and Supervised Learning with the Random Forest Algorithm for 
%   Traffic Scenario Clustering and Classification


%______________________________________________________
%% ADDITIONAL NOTES
% Desired distance: distance to a vehicle which fulfills a THW of 1 second.
% Default values: Default values are |111.1111...| or |11.1111| (both,
%   positive and negative). These values are used e.g. if no vehicle present.


%______________________________________________________
%% FEATURE DESCRIPTION

FeatureNames{1} = 'ScenarioTime'; % timespan of the scenario [s]
FeatureNames{2} = 'Ego_v(1)'; %Velocity EGO at start Scenario [m/s]
FeatureNames{3} = 'Ego_v(THW_min_Idx)'; %Velocity EGO at THW_min frame [m/s]
FeatureNames{4} = 'Ego_v(end)'; %Velocity EGO at final scenario frame [m/s]
FeatureNames{5} = 'Ego_acc(1)'; %long. Acceleration EGO at start Scenario [m/s^2]
FeatureNames{6} = 'Ego_acc(THW_min_Idx)'; %long. Acceleration EGO at THW_min frame [m/s^2]
FeatureNames{7} = 'min(Ego_acc)'; %maximum deceleration in Scenario [m/s^2]
FeatureNames{8} = 'BrakingEgoTimeToMinTHW'; %Time duration the vehicle was braking until the min THW frame reached [s]
FeatureNames{9} = 'd_Act(1)'; %Relative distance from EGO to its leader vehicle (center of gravity (COG)) at start Scenario [m] | If no leader vehicle, default value is 111.111
FeatureNames{10} = 'd_Act(THW_min_Idx)'; %Relative distance from EGO to its leader vehicle (COG) at THW_min frame [m] | If no leader vehicle, default value is 111.111
FeatureNames{11} = 'd_Act(end)'; %Relative distance from EGO to its leader vehicle (COG) at at final scenario frame [m] | If no leader vehicle, default value is 111.111
FeatureNames{12} = 'max(d_Des - d_Act)'; % Maximum difference between desired relative distance and actual distance in scenario [m]
FeatureNames{13} = '(dtw(d_Des,d_Act)) / (ScenarioTime)'; % dynamic time warp function normalized to scenario timespan []. dtw standard Matlab implementation, for more details see "dtw" help: https://de.mathworks.com/help/signal/ref/dtw.html
FeatureNames{14} = '(integral(d_Des-d_Act[1:THW_min])/THW_min_Idx'; % the surface enclosed in the desired and actual relative distance over time from first time frame to THW_min time frame, normalized to the time frame of THW_min
FeatureNames{15} = '(integral(d_Des-d_Act[THW_min:end])/(ScenarioTime - THW_min_Idx)';  % % the surface enclosed in the desired and actual relative distance over time from the THW_min time frame to the final scenario frame, normalized to the timespan from THW_min to End
FeatureNames{16} = '(idx_dAct_max-idx_dAct_min)'; %Time difference between min/max dAct [s]
FeatureNames{17} = 'THW_min'; %Actual THW_min value [s]
FeatureNames{18} = '(THW_min/THW_max)/(timelength of THW_min - THW_max)'; % THW_min value divided by the THW_max value, normalized by the timespan between these two events.
FeatureNames{19} = 'CritIndex_THW_min'; % Minimum value of the Crit. Index, which is defined as: relative velocity^2 / THW_min 
FeatureNames{20} = 'CritIndex_1stStep'; %Crit. Index at first time step | Limited to 111.1111
FeatureNames{21} = 'd_Act_Rear(1)'; %Actual distance to rear vehicle at first time step of scenario [m]. If no vehicle present, value is set to 11.11111
FeatureNames{22} = 'min(d_Act_Rear)'; %Min. distance to rear vehicle at first time step of scenario [m]
FeatureNames{23} = 'd_Act_Rear(THW_min_Idx)'; %Actual distance to rear vehicle at THW_min time step of scenario [m]
FeatureNames{24} = 'd_Act_Rear(end)'; %Actual distance to rear vehicle at final time step of scenario [m]
FeatureNames{25} = 'd_ecl_min_leftLn_Front_1stStep'; % Min relative Distance to vehicle on left Lane and in front of Ego(COG to COG) at first time frame of scenario [m] | If no vehicle present, value is set to -11.11111
FeatureNames{26} = 'd_ecl_min_leftLn_Rear_1stStep'; % Min relative Distance to vehicle on left Lane and behing Ego(COG to COG) at first time frame of scenario [m] | If no vehicle present, value is set to 11.11111
FeatureNames{27} = 'd_ecl_min_rightLn_Front_1stStep'; % Min relative Distance to vehicle on right Lane and in front of Ego(COG to COG) at first time frame of scenario [m] | If no vehicle present, value is set to -11.11111
FeatureNames{28} = 'd_ecl_min_rightLn_Rear_1stStep'; % Min relative Distance to vehicle on right Lane and behing Ego(COG to COG) at first time frame of scenario [m] | If no vehicle present, value is set to 11.11111
FeatureNames{29} = 'd_ecl_min_leftLn_Front_THWmin'; % Min relative Distance to vehicle on left Lane and in front of Ego(COG to COG) at THW_min time frame of scenario [m]
FeatureNames{30} = 'd_ecl_min_leftLn_Rear_THWmin'; % Min relative Distance to vehicle on left Lane and behing Ego(COG to COG) at THW_min time frame of scenario [m]
FeatureNames{31} = 'd_ecl_min_rightLn_Front_THWmin'; % Min relative Distance to vehicle on right Lane and in front of Ego(COG to COG) at THW_min time frame of scenario [m]
FeatureNames{32} = 'd_ecl_min_rightLn_Rear_THWmin'; % Min relative Distance to vehicle on right Lane and behing Ego(COG to COG) at THW_min time frame of scenario [m]
FeatureNames{33} = 'd_ecl_min_leftLn_Front_end'; % Min relative Distance to vehicle on left Lane and in front of Ego(COG to COG) at final time frame of scenario [m]
FeatureNames{34} = 'd_ecl_min_leftLn_Rear_end'; % Min relative Distance to vehicle on left Lane and behing Ego(COG to COG) at final time frame of scenario [m]
FeatureNames{35} = 'd_ecl_min_rightLn_Front_end'; % Min relative Distance to vehicle on right Lane and in front of Ego(COG to COG) at final time frame of scenario [m]
FeatureNames{36} = 'd_ecl_min_rightLn_Rear_end'; % Min relative Distance to vehicle on right Lane and behing Ego(COG to COG) at final time frame of scenario [m]
FeatureNames{37} = 'EgoOuterLane (1=left)'; %Check if EGO is on the outer left or outer right lane of the road (1=left, -1=right, 0= middle) []
FeatureNames{38} = 'EgoLnChangeBegin'; %check if EGO started to perform a lane change (1/0) 
FeatureNames{39} = 'EgoLnChangeDone'; %check if EGO performed a complete lane change (1/0)
FeatureNames{40} = 'EgoLnChangeDone_timeFrameRelative'; %Relative time frame within scenario when LaneChange was completed
FeatureNames{41} = 'cutInRelTimeEnd'; %%relative time frame of the scenario, if a Cut-In maneuver of a target vehicle was performed
FeatureNames{42} = 'cutInDistReduceEnd'; %how much was the distance reduced due to Cut-In [m]
FeatureNames{43} = 'cutInSide (1+ from left)'; % cutInSide = 1 --> from left to right |  cutInSide = -1 --> from right to left
FeatureNames{44} = 'LnChangeSurroundingVeh'; % any of the 6 surrounding vehicles performed lane change, except Leader
FeatureNames{45} = 'SurrAllVeh_1st'; % number of surrounding vehicles at 1st time frame (max = 6) below desired distance
FeatureNames{46} = 'SurrAllVeh_THW_min'; % number of surrounding vehicles at THW_min time frame (max = 6) below desired distance
FeatureNames{47} = 'SurrAllVeh_end'; % number of surrounding vehicles at final time frame of the scenario (max = 6) below desired distance