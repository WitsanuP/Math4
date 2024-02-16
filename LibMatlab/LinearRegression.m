function [a1, a0] = LinearRegression(x,y)
%
% LinearRegression uses linear least-squares approximation to fit a data
% by a line in the form y = a1*x + a0. It also returns the plot of the
% original data together with the best line fit.
%
%   [a1, a0] = LinearRegression(x,y), where
%
%       x, y are n-dimensional row or column vectors of data,
%
%       a1 and a0 are the coefficients that describe the linear fit.
%
n = length(x);
Sumx = sum(x); Sumy = sum(y); Sumxx = sum(x.*x); Sumxy = sum(x.*y);
den = n*Sumxx - Sumx^2;
a1 = (n*Sumxy - Sumx*Sumy)/den; a0 = (Sumxx*Sumy - Sumxy*Sumx)/den;
% Plot the data and the line fit
l = zeros(n,1); % Pre-allocate
for i = 1:n,
    l(i) = a1*x(i) + a0;    % Calculate n points on the line
end
plot(x,y,'o')
hold on
plot(x,l)
end

