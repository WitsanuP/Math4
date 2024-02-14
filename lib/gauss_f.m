function [fp,tbl] = gauss_f(xd,yd,xp)
%GAUSS_F Summary of this function goes here
%   Detailed explanation goes here
n = length(xd); tbl = zeros(n,n+1);
if(length(yd) == n)
    tbl(:,1) = xd';
    tbl(:,2) = yd';
else
    print('error');
end
for j = 3:n+1
    for i =1:n-j+2
        tbl(i,j) = tbl(i+1,j-1)-tbl(i,j-1);
    end
end
h = xd(2)- xd(1);
if rem(n,2) == 0
    k = n/2+1;
else
    k = n/2+0.5;
end
p = (xp-xd(k))/h; f = zeros(n);
pt = cumprod([1,p-(0:n-2)]); l =0; fp = 0;
for i = 0:n-1
    f(i+1) = tbl(k-l,i+2);
    if rem(i,2) == 0
        l = l+1;
    end
    fp = fp +f(i+1)*pt(i+1)/factorial(i);
end
end

