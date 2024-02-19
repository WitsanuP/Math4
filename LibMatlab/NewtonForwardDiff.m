function df = NewtonForwardDiff(x,y)
% NewtonForwardDiff(x,y)
% Condision is 
%       x0 == x(1),when find f'(x0)
%       p=0
% make by WitsanuP
h = x(2)-x(1);
df = 0;
table = GaussTable(x,y);
n = length(x);

for(i=1:n-1)
    df = df + (-1)^(i+1)*(1/i)*table(1,i+2);
end
df = df/h;