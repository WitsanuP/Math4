function I = Romberg(f,a,b,n,n_levels)
%
% Romberg uses the Romberg integration scheme to find integral estimates
% at different levels of accuracy.
%
%   I = Romberg(f,a,b,n,n_levels), where
%
%   f is an anonymous function representing the integrand,
%   a and b are the limits of integration,
%   n is the initial number of equal-length subintervals in [a,b],
%   n_levels is the number of accuracy levels,
%
%   I is the matrix of integral estimates.
%
I = zeros(n_levels,n_levels); % Pre-allocate

% Calculate the first-column entries by using the composite
% trapezoidal rule, where the number of subintervals is doubled
% going from one element to the next.

for i = 1:n_levels,
    n_intervals = 2^(i-1)*n;
    I(i,1) = TrapComp(f,a,b,n_intervals);
end

% Starting with the second level, use Romberg scheme to generate
% the remaining entries of the table.

for j = 2:n_levels,
    for i = 1:n_levels-j+1,
        I(i,j) = (4^(j-1)*I(i+1,j-1)-I(i,j-1))/(4^(j-1)-1);
    end
end