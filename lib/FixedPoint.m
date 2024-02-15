function [r,n] = FixedPoint(g,x1,kmax,tol)

%
% FixedPoint uses the fixed-point method to approximate a fixed point
% of g(x).
%
%   [r, n] = FixedPoint(g, x1, kmax, tol), where
%
%       g is an anonymous function representing g(x),
%       x1 is the initial point,
%       kmax is the maximum number of iterations (default 20),
%       tol is the scalar tolerance for convergence (default 1e-4),
%
%       r is the approximate fixed point of g(x),
%       n is the number of iterations needed for convergence.
%

if nargin < 4 || isempty(tol), tol = 1e-4;end
if nargin < 3 || isempty(kmax), kmax = 20; end
x = zeros(1,kmax);
x(1) = x1;
for n = 1:kmax, 
    x(n+1) = g(x(n));
    if abs(x(n+1)-x(n)) < tol
        r = x(n+1);
        return
    end
end
f = 'failure'; % Failure to converge after kmax iterations
