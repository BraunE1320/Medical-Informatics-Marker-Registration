% Function SimulatedManyPatientPoses uses function SimulatePatientPose to
% randomly create points that will correspond to a theoretical patient in an MRI
%
% Function will take in fiducial markers and a target and map them to
% corresponding simulated points given certain random translation and
% rotation
%
% Function created on February 2nd, 2016 by Eric Braun 10121660

function [Results, Errors] = SimulateManyPatientPoses(F1,F2,F3,Target)

% Create Matrices
Transformations = zeros(20,3);
Results = zeros(20,16);
Errors = zeros(20,2);

for i = 1:20
    % Random rotation +/- 20 degrees
     Transformations(i,1) = 20 * (2 * rand - 1);
    
    % Random x translation between 0 and 40mm
   Transformations(i,2) = 40 * (2 * rand - 1);
    
    % Random y translation between 0 and 40mm
   Transformations(i,3) = 40 * (2 * rand - 1);
    
   % Call function to create each point
    [M1,M2,M3,T] = SimulatePatientPose(F1,F2,F3,Target,Transformations(i,1),Transformations(i,2),Transformations(i,3));
    
    % File results into matrix
    Results(i,1:4) = M1';
    Results(i,5:8) = M2';
    Results(i,9:12) = M3';
    Results(i,13:16) = T';
    
    % Calculate FRE and TRE of data points
    [Errors(i,1),Errors(i,2)] = RegistrationCheck(F1,F2,F3,Target,M1',M2',M3',T');
end
end