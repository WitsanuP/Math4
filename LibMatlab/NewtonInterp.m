function yi = NewtonInterp(x,y,xi)
%
% NewtonInterp finds the Newton divided-difference interpolating
% polynomial that agrees with the data (x,y) and uses it to find the
% interpolated value at xi.
%
%   yi = NewtonInterp(x,y,xi), where
%
%   x, y are n-dimensional row or column vectors of data,
%   xi is a specified point,
%
%   yi is the interpolated value at xi.
%
n = length(x);
a = zeros(1,n);     % Pre-allocate
a(1) = y(1);
DivDiff = zeros(1,n-1);     % Pre-allocate
for i = 1:n-1,
    DivDiff(i,1) = (y(i+1) - y(i))/(x(i+1) - x(i));
end
for j = 2:n-1,
    for i = 1:n-j,
        DivDiff(i,j) = (DivDiff(i+1,j-1) - DivDiff(i,j-1))/(x(j+i) - x(i));
    end
end
for k = 2:n,
    a(k) = DivDiff(1,k-1);
end
yi = a(1);
xprod = 1;
for m = 2:n,
    xprod = xprod*(xi - x(m-1));
    yi = yi + a(m)*xprod;
end


