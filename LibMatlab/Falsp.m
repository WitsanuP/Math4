function [x,err,xx] = Falsp(f,a,b,TolX,MaxIter)
%FALSP Summary of this function goes here
%   Detailed explanation goes here
TolFun = eps; fa = feval(f,a); fb = feval(f,b);
if fa*fb >0,error('We must have f(a)f(b)<0!'); end
for k = 1: MaxIter
xx(k) = (a*fb-b*fa)/(fb-fa);
fx = feval(f,xx(k));
err = max(abs(xx(k) - a),abs(b - xx(k)));
if abs(fx) < TolFun || err < TolX , break;
elseif fx*fa > 0,a = xx(k); fa = fx;
else b = xx(k); fb = fx; end
end
x = xx(k)
if k == MaxIter, fprintf('The best in %d interations\n',MaxIter), end