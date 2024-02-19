function I = Simpson(f,a,b,n)
%
% Simpson estimates the value of the integral of f(x) from a to b
% by using the composite Simpson’s 1/3 rule applied to n equal-length
% subintervals.
%
%   I = Simpson(f,a,b,n), where
%
%   f is an anonymous function representing the integrand,
%   a, b are the limits of integration,
%   n is the (even) number of subintervals,
%
%   I is the integral estimate.
%   
h = (b-a)/n; x = a:h:b; I = 0;
for i = 1:2:n,
I = I + f(x(i)) + 4*f(x(i+1)) + f(x(i+2));
end
I = (h/3)*I;