function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%Inputs:
%   func - the function being evaluated
%   xl - the lower guess
%   xu - the upper guess
%   es - the desired relative error (should default to 0.0001%)
%   maxit - the maximum number of iterations to use (should default to 200)
%Outputs
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed
if nargin < 5
   maxit = 200;
elseif nargin < 4
    maxit = 200;
    es = 0.0001;
end
if func(xl)*func(xu) >= 0
    error('root does not exist in this bracket')
end
ea = 100;
iter = 0
while ea > es && iter < maxit
    fxl = func(xl);
    fxu = func(xu);
    xr = xu - ((fxu)*(xl-xu))/(fxl-fxu)
    fxr = func(xr)
    if (fxr > 0 && fxu >0) || (fxr < 0 && fxu < 0)
       xrold = xl
       xu = xr
    else if (fxr > 0 && fxl > 0) || (fxr < 0 && fxl < 0)
       xrold = xl
       xl = xr
    end
    iter = iter + 1;
    ea = abs((xr-xrold)/xr)*100;
end
root = xr;
fx = func(xr);
            
        
end