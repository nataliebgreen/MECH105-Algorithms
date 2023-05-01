function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
n = length(sortedX);
Q1_idx = floor((1+n)/4);
Q3_idx = floor((3+3*n)/4);
Q1  = sortedX(Q1_idx);
Q3 = sortedX(Q3_idx);
IQR = Q3 - Q1;

if size(sortedY) ~= size(sortedX)
    error('arrays are not the same size')
end

% y needs to be above Q1 - 1.5*IQR and below Q3 +1.5*IQR
uThresh = Q3 + 1.5*IQR
lThresh = Q1 - 1.5*IQR

for i = 1:n
    if sortedY(i) < lThresh || sortedY(i) > uThresh
        sortedY(i) =[];
        sortedX(i) = [];
    end
    n=length(sortedX);
end

%linear regression
fX = sortedX
fY = sortedY
sxy = sum(fX.*fY);
sx = sum(fX);
sy = sum(fY);
sx2 = sum(fX.^2);
sy2= sum(fY.^2);

a1 = (n*sxy-sx*sy)/(n*sx2-sx.^2);
a0 = mean(fY)-a1*mean(fX);

St = (sum((fY-mean(fY)).^2));
Sr = sum((fY-a0-a1*fX).^2);
Rsquared = (St-Sr)/St

slope = a1;
intercept = a0;

end