function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% error for wrong size inputs

n=length(x);

if length(x) ~= length(y)
    error('Inputs must be the same size')
end

% error for x inputs
diffs = diff(x);
tolerance = 1e-12;

if max(abs(diffs - diffs(1))) > tolerance
    error('elements are not equally spaced')
end

% Warning
if rem(n,2) == 0 %is odd (even number of points but odd number of segments)
   n=length(x)-1
else %is even
    n=length(x)
end

%Simpson's rule
h = diffs(1)
yodd = y(2:2:n-1)
yeven = y(3:2:n-2)
I = (y(1) + 4*sum(yodd) + 2*sum(yeven) + y(n)) * h/3

%trap rule
 if n ~= length(x)
     I = I + (y(length(x))+y(n))*h/2
     warning('trapezoidal rule must be used for the last segment')
 end
end