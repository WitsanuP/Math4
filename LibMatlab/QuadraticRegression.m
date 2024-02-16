function [a2, a1, a0] = QuadraticRegression(x,y)
%
% QuadraticRegression uses quadratic least-squares approximation to fit a
% data by a 2nd-degree polynomial in the form y = a2*x^2 + a1*x + a0.
%
% [a2, a1, a0] = QuadraticRegression(x,y), where
%
%   x, y are n-dimensional row or column vectors of data,
%
%   a2, a1 and a0 are the coefficients that describe the quadratic fit.
%
n = length(x);
Sumx = sum(x); Sumy = sum(y);
Sumx2 = sum(x.^2); Sumx3 = sum(x.^3); Sumx4 = sum(x.^4);
Sumxy = sum(x.*y); Sumx2y = sum(x.*x.*y);

% Form the coefficient matrix and the vector of right-hand sides
A = [n Sumx Sumx2;Sumx Sumx2 Sumx3;Sumx2 Sumx3 Sumx4];
b = [Sumy;Sumxy;Sumx2y];
w = A\b;    % Solve for the coefficients
a2 = w(3); a1 = w(2); a0 = w(1);
% Plot the data and the quadratic fit
xx = linspace(x(1),x(end)); % Generate 100 points for plotting purposes
p = zeros(100,1); % Pre-allocate
for i = 1:100,
    p(i) = a2*xx(i)^2 + a1*xx(i) + a0; % Calculate 100 points
end
plot(x,y,'o')
hold on
plot(xx,p)
end