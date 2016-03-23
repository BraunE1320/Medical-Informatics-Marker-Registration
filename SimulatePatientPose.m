% Function SimulatePatientPose used to simulate a patient for an MRI scan
% using 3 fiducial markers found in scanner frame along with target of
% interest by translating along the x and y axis and rotating around the y.
% Inputs: 3 fiducial markers (F1,F2,F33
%         Target Point [3 x 1]
%         Scalar rotation around y, translation of x and y axis
%
% Outputs: New transformed markers [M1,M2,M3]
%          Transformed target [T]
%
% Function created on January 1st by Eric Braun, 10121660

function [M1,M2,M3,T] = SimulatePatientPose(F1,F2,F3,Target,Roty,Transx,Transy)

% Convert given input rotation degrees to radian
r = degtorad(Roty);

% Rotation matrix about y-axis
Rotation = [cos(r), 0, -sin(r), 0;
            0,      1,     0  , 0;
            sin(r), 0,  cos(r), 0
            0     , 0,     0,   1];

% Translation matrix
Translation = [1, 0, 0, Transx;
               0, 1, 0, Transy;
               0, 0, 1,    0  ;
               0, 0, 0,    1 ];

% Add the "padded" 1 to the markers and target
F1 = cat(1,F1',1);
F2 = cat(1,F2',1);
F3 = cat(1,F3',1);
Target = cat(1, Target', 1);

% Multiply the markers and target by the transformation matrices to create
% the new translated markers and target
M1 = Translation * (Rotation * F1);
M2 = Translation * (Rotation * F2);
M3 = Translation * (Rotation * F3);

T = Translation * (Rotation * Target);

end