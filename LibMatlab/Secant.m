function [r, n] = Secant(f, x1, x2, tol, N)
%
% Secant uses secant method to approximate roots of f(x) = 0.
%
%   [r, n] = Secant(f, x1, x2, tol, N), where
%
%   f is a symbolic function representing f(x),
%   x1 and x2 are the initial values of x,
%   tol is the scalar tolerance of convergence (default 1e-4),
%   N is the maximum number of iterations (default 20),
%
%   r is the approximate root of f(x) = 0,
%   n is the number of iterations required for convergence.
%
if nargin < 5 || isempty(N), N = 20; end
if nargin < 4 || isempty(tol), tol = 1e-4; end
f = matlabFunction(f);
x = zeros(1, N+1); % Pre-allocate
for n = 2:N,
    if x1 == x2,
        r='failure';
        return
    end
        x(1) = x1; x(2) = x2;
        x(n+1) = x(n) - ((x(n)-x(n-1))/(f(x(n))-f(x(n-1))))*f(x(n));
    if abs(x(n+1)-x(n)) < tol,
        r = x(n+1);
        return
    end
end