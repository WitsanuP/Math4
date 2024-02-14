function [fp dt] = NewBw(x,fx,xp)
n = numel(x);
dt = zeros(n,n+1);f = zeros(n);
for i = 1:n
    dt(i,1) = x(i);
    dt(i,2) = fx(i);
end
k = n;
for j = 3:n +1
    for i = 1:k-1
        dt(i,j) = dt(i+1,j-1) - dt(i,j-1);
    end
    k= k-1;
end
h = x(2) - x(1);
p = (xp - x(n))/h;
pt = cumprod([1,p+(0:n-2)]); fp = 0;
for i = 0:n-1
    f(i+1) = dt(1,i+2);
    fp =fp + f(i+1)*pt(i+1)/factorial(i);
end

