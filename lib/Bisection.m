function c = Bisection(f, a, b, kmax, tol)
%   page59 make balor
%
% Bisection uses the bisection method to find a root of f(x) = 0
% in the interval [a,b].
%
%   c = Bisection(f, a, b, kmax, tol), where
%
%       f is an anonymous function representing f(x),
%       a and b are the endpoints of interval [a,b],
%       kmax is the maximum number of iterations (default 20),
%       tol is the scalar tolerance for convergence (default 1e-4),
%
%       c is the approximate root of f(x) = 0.
%   
%   like Bisct, Bisection(f, a, b, tol*, kamx*)
if nargin < 5 || isempty(tol), tol = 1e-4; end
if nargin < 4 || isempty(kmax), kmax = 20; end
if f(a)*f(b) > 0
    c = 'failure';
    return
end
disp(' k      a      b      c      (b-a)/2')
for k = 1:kmax,
    c = (a+b)/2;    % Find the first midpoint
    if f(c) == 0    % Stop if a root has been found
        return
    end
fprintf('%3i   %11.6f%11.6f%11.6f%11.6f\n',k,a,b,c,(b-a)/2)
    if (b-a)/2 < tol    % Stop if tolerance is met
        return
    end
    if f(b)*f(c) > 0    % Check sign changes
        b = c;          % Adjust the endpoint of interval
    else a = c;
    end
end