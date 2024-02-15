function [r, n] = Newton(f, x1, tol, N)
%
%  Newton uses Newton s method to approximate a root of f(x) = 0.
%
%   [r, n] = Newton(f, x1, tol, N), where
%
%       f is a symbolic function representing f(x),
%       x1 is the initial point,
%       tol is the scalar tolerance for convergence (default 1e-4),
%       N is the maximum number of iterations (default 20),
%
%       r is the approximate root of f(x) = 0,
%       n is the number of iterations required for convergence.
%
if nargin < 4 || isempty(N), N = 20; end
if nargin < 3 || isempty(tol), tol = 1e-4; end
% Find f' and convert to MATLAB function for evaluation
fp = matlabFunction(diff(f));
% Convert f to MATLAB function for evaluation
f = matlabFunction(f);
x = zeros(1, N+1);      % Pre-allocate
x(1) = x1;
for n = 1:N,
    if fp(x(n)) == 0,
        r ='failure';
        return
    end
    x(n+1) = x(n) - f(x(n))/fp(x(n));
    if abs(x(n+1) - x(n)) < tol,
        r = x(n+1);
        return
    end
end
