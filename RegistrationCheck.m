% Funciont to compute the FRE and TRE of two sets of data, map one on top
% of the other using registration transformation matrix then find the
% distance between the simulated and actual points for the markers (FRE)
% and the target (TRE).
%
% Function created on Feb 2nd, 2016 by Eric Braun 10121660

function [FRE,TRE] = RegistrationCheck(F1,F2,F3,T1,M1,M2,M3,T2)

% Take out the buffered 1 from the markers to allow us to use the fiducial
% registration
M1a = M1(1:3);
M2a = M2(1:3);
M3a = M3(1:3);

% Create transformation matrix from marker frame to original fiducial point
% frame
Transformation = FiducialRegistration(F1,F2,F3,M1a,M2a,M3a);

% Add buffer to points
F1 = cat(1,F1',1);
F2 = cat(1,F2',1);
F3 = cat(1,F3',1);

% Transform points first to origin
F1T = Transformation * F1;
F2T = Transformation * F2;
F3T = Transformation * F3;

% Transform target
T1 = cat(1,T1',1);
TT = Transformation * T1;

% Create second transformation matrix to second origin
Transformation2 = FiducialRegistration(F1T(1:3),F2T(1:3),F3T(1:3),M1a,M2a,M3a);

% Multiply the new points by the second transformation matrix
P1 = Transformation2 * F1T;
P2 = Transformation2 *  F2T;
P3 = Transformation2 * F3T;

TT2 = Transformation2* TT;
% Calculate FRE: Fiducual registration error as the distance from the
% original fiducal points and the reconstructed points

FRE = norm(M1' - P1) + norm(M2' - P2) + norm(M3' - P3);

% Repeat for the target point
TRE = norm(T2' - TT2);


end