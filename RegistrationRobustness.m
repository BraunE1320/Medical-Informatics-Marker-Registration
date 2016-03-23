% Function to test robustness of registration
% Function will add random FLE error to each simualted point then compute
% the FRE and TRE for each pose using RegistrationCheck.m
% Uses data from the SimulateManyPatientPoses function
%
% Function created on Feb 2, 2016 by Eric Braun 10121660

function [avgFRE, avgTRE] = RegistrationRobustness(F1,F2,F3,Target,Emax)

    % create empty matrices for new values
    F1s = zeros(20:3);
    F2s = zeros(20:3);
    F3s = zeros(20:3);

    % Fill in data with error
    for i = 1:20
        F1s(i,:) = AddRandomTranslationError(F1,Emax);
        F2s(i,:) = AddRandomTranslationError(F2,Emax);
        F3s(i,:) = AddRandomTranslationError(F3,Emax);
    end
    
    
    for j = 1:20
    % Call function to create each point 
    [M1,M2,M3,T] = SimulatePatientPose(F1,F2,F3,Target,0,0,0);
    
    
    % Calculate FRE and TRE of data points
    [Errors(i,1),Errors(i,2)] = RegistrationCheck(F1s(j,:),F2s(j,:),F3s(j,:),Target,M1',M2',M3',T');
    
    end
    
    % Take the average of the spoiled data
    avgFRE = mean(Errors(:,1));
    avgTRE = mean(Errors(:,2));

end