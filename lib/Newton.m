function [r,n] = Newton(f,x1,tol,N) %f == symbolic
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
if nargin < 4 || isempty(N), N = 20;end
if nargin < 3 || isempty(tol), tol = 1e-4; end
fp = matlabFunction(diff(f));
f = matlabFunction(f);
x = zeros(1,N+1);
x(1) = x1;
for n = 1:N
    if fp(x(n)) == 0
        r = 'failure';
        return
    end
    x(n+1) = x(n) - f(x(n))/fp(x(n));
    if abs(x(n+1)-x(n)) < tol
        r = x(n+1);
        return
    end
end

