% Function CartesianSystem to create an orthonormal basis vector system,
% defined by 3 vectors in each direction and a center point, from 3
% fiducial marker points. 
% Input: 3 markers [3x1]
% Output: x, y, and z component direction vectors and gravitational center
%
% Function created on February 1st, 2016 by Eric Braun 10121660


function [x, y, z, center] = CartesianSystem(A, B, C)

% x base vector is distance between B and A.
y = B-A;

% z base vector is the cross product of x and distance between C and A.
x = cross(y, C-A);

% y base vector is the cross product of z and x
z = cross(x,y);

% normalize base vectors.
x = x/norm(x);
y = y/norm(y);
z = z/norm(z);

% Center is taken as the gravitational center of the 3 markers
center = (A + B + C)/3;

end