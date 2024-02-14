function [a1,a0] = LinearRegression(x,y)
n = length(x);
Sumx = sum(x);
Sumy = sum(y);
Sumxx = sum(x.*x);
Sumxy = sum(x.*y);
den = n*Sumxx - Sumx^2;
a1 = (n*Sumxy - Sumx*Sumy)/den;
a0 = (Sumxx*Sumy - Sumxy*Sumx)/den;
l = zeros(n,1);
for i = 1:n
    l(i) = a1*x(i) + a0;
end
plot(x,y,'o')
grid on
hold on
plot(x,l)
end

