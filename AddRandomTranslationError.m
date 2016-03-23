% Function AddRandomTranslationError used to randomly skew a 3D point
% within a given range of random values
% Inputs: Point [3 x 1] and Emax (Max amount of error allowed)
% Output: TransformedPoint (Point with the random error added)
%
% Function created on February 1st, 2016 by Eric Braun 10121660

function [TransformedPoint] = AddRandomTranslationError(Point, Emax)

    % Transform the x, y, and z components, positively or negatively, by a value
    % between 0 and Emax
    Transformedx = Point(1) + (Emax * (2 * rand - 1));
    Transformedy = Point(2) + (Emax * (2 * rand - 1));
    Transformedz = Point(3) + (Emax * (2 * rand - 1));
    
    % New point consists of the 3 components
    TransformedPoint = [Transformedx,Transformedy,Transformedz];


end