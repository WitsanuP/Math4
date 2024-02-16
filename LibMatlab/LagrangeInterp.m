function yi = LagrangeInterp(x,y,xi)
%
% LagrangeInterp finds the Lagrange interpolating polynomial that goes
% through the data (x,y) and uses it to find the interpolated value
% at xi.
%
%   yi = LagrangeInterp(x,y,xi), where
%
%   x, y are n-dimensional row or column vectors of data,
%   xi is a specified point,
%
%   yi is the interpolated value at xi.
%
n = length(x);
L = zeros(1,n); % Pre-allocate
for i = 1:n,
    L(i) = 1;
    for j = 1:n,
        if j ~= i,
            L(i) = L(i)*(xi - x(j))/(x(i) - x(j));
        end
    end
end
yi = sum(y.*L);