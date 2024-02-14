function yi = LagrangeInterp(x,y,xi)
%LAGRANGEINTERP Summary of this function goes here
%   Detailed explanation goes here
n = length(x);
L = zeros(1,n);
for i = 1:n
    L(i) = 1;
    for j = 1:n
        if j ~= i,L(i) = L(i)*(xi-x(j))/(x(i)-x(j));
        end
    end
end
yi = sum(y.*L);
