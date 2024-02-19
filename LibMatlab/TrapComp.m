function I = TrapComp(f,a,b,n)
%
% TrapComp estimates the value of the integral of f(x) from a to b
% by using the composite trapezoidal rule applied to n equal-length
% subintervals.
%
%   I = TrapComp(f,a,b,n), where
%
%       f is an anonymous function representing the integrand,
%       a and b are the limits of integration,
%       n is the number of equal-length subintervals in [a,b],
%
%       I is the integral estimate.
%
h = (b-a)/n;x = a:h:b;
y = f(x);
I = (y(1) + 2*sum(y(2:end-1)) + y(end))*h/2;
end
