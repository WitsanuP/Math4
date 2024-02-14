function Nroots = Nzeros(f, n, x0, tol, delx)
% page 83-84 form balor
%
% Nzeros approximates a desired number of roots of f(x) on the right of
% a specified point.
%
%   Nroots = Nzeros(f, n, x0, tol, delx), where
%
%       f is an anonymous function representing f(x),
%       n is the number of desired roots,
%       x0 is the starting value,
%       tol is the scalar tolerance (default is 1e-6),
%       delx is the increment in x (default is 0.1),
%
%       Nroots is the list of n roots of f(x) to the right of x0.
%
if nargin < 5 || isempty(delx), delx = 0.1; end
if nargin < 4 || isempty(tol), tol = 1e-6; end
x = x0; dx = delx;
Nroots = zeros(n,1); % Pre-allocate
for i = 1:n
% sgn1 = sign((f(x)));
while abs(dx/x) > tol
    if sign((f(x))) ~= sign((f(x+dx)))
        dx = dx/2;
    else
        x = x + dx;
    end
end
Nroots(i) = x; dx = delx;
x = x + abs(0.05*x);
end