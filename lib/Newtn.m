function [x,fx,xx] = Newtn(f,df,x0,TolX,MaxIter) % f = function handle
%NEWTN Summary of this function goes here
%   Detailed explanation goes here
h = 1e-4; h2 = 2*h; TolFun = eps;
if nargin == 4 && isnumeric(df), MaxIter = TolX; TolX = x0; x0 =df; end
xx(1) = x0;fx = feval(f,x0);
for k = 1:MaxIter
if ~isnumeric(df),dfdx = feval(df,xx(k));
else dfdx = (feval(f,xx(k)+h)-feval(f,xx(k)-h))/h2;
end
dx = -fx/dfdx;
xx(k+1) = xx(k)+dx;
fx = feval(f,xx(k+1));
if abs(fx)<TolFun || abs(dx) < TolX, break;end
end
x =xx(k+1);
if k == MaxIter, fprintf('The best in %d iterations\n',MaxIter),end
