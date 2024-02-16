function [r, k] = RegulaFalsi(f, a, b, kmax, tol)
%
% RegulaFalsi uses the regula falsi method to approximate a root of f(x) = 0
% in the interval [a,b].
%
%   [r, k] = RegulaFalsi(f, a, b, kmax, tol), where
%
%       f is an anonymous function representing f(x),
%       a and b are the limits of interval [a,b],
%       kmax is the maximum number of iterations (default 20),
%       tol is the scalar tolerance for convergence (default 1e-4),
%
%       r is the approximate root of f(x) = 0,
%       k is the number of iterations needed for convergence.
%
if nargin < 5 || isempty(tol), tol = 1e-4; end
if nargin < 4 || isempty(kmax), kmax = 20; end
c = zeros(1,kmax);      % Pre-allocate
if f(a)*f(b) > 0
    r = 'failure';
    return
end
disp(' k    a       b')
for k = 1:kmax,
    c(k) = (a*f(b)-b*f(a))/(f(b)-f(a));     % Find the x-intercept
    if f(c(k)) == 0     % Stop if a root has been found
        return
    end
    fprintf('%2i    %11.6f%11.6f\n',k,a,b)
    if f(b)*f(c(k)) > 0     % Check sign changes
        b = c(k);           % Adjust the endpoint of interval
    else a = c(k);
    end
    c(k+1) = (a*f(b)-b*f(a))/(f(b)-f(a));   % Find the next x-intercept
    if abs(c(k+1)-c(k)) < tol,  % Stop if tolerance is met
        r = c(k+1);
        return
    end
end
