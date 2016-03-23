% Function to create a 4x4 transformation matrix between 2 sets of 3
% fiducial markers.
%
% Maps the first to the origin then to the next frame
% Creates orthonormal basis vector systems of each then computes the
% translation and roattion matricies for each and multiplies together to
% form the overall matrix
%
% Function created on Febrarury 2nd, 2016 by Eric Braun 10121660


function [T] = FiducialRegistration(A1,B1,C1,A2,B2,C2)

% Create cartesiansystems of markers
[e1, e2, e3, center1] = CartesianSystem(A1,B1,C1);
[v1, v2, v3, center2] = CartesianSystem(A2,B2,C2);

% Rotation matrix between the two systems
ROTATION = [dot(e1,v1), dot(e1,v2), dot(e1,v3), 0;
      dot(e2,v1), dot(e2,v2), dot(e2,v3), 0;
      dot(e3,v1), dot(e3,v2), dot(e3,v3), 0;
           0    ,     0     ,      0    , 1];

% Translation matrix between the two systems
TRANSLATION = [1,0,0,center2(1)-center1(1);
               0,1,0,center2(2)-center1(2);
               0,0,1,center2(3)-center1(3);
               0,0,0     1                ];
           
% Overall transformation matrix is the trans * rot           
T = (TRANSLATION * ROTATION);
       
end