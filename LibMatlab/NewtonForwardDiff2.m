function ddf = NewtonForwardDiff2(x,y)
% NewtonForwardDiff2(x,y)
% Condision is 
%       x0 == x(1),when find f''(x0)
%       p=0
% make by WitsanuP
h = x(2)-x(1);
ddf = 0;
table = GaussTable(x,y);
n = length(x);
tmp=0;
for(i=1:n-2)
    ddf = ddf + (-1)^(i+1)*((i*tmp+factorial(i-1))/(factorial(i+1)))*table(1,i+3);
    tmp = (i*tmp+factorial(i-1));
end
ddf = ddf/h/h*2;