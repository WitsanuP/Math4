function [r,n] = FixedPoint(g,x1,kmax,tol)
%FIXEDPOINT Summary of this function goes here
%   Detailed explanation goes here
if nargin < 4 || isempty(tol), tok = 1e-4;end
if nargin < 3 || isempty(kmax), kmax = 20; end
x = zeros(1,kmax);
x(1) = x1;
for n = 1:kmax
    x(n+1) = g(x(n));
    if abs(x(n+1)-x(n)) < tol
        r = x(n+1);
        return
end
end
f = 'failure'
