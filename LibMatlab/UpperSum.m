function riemannsum = UpperSum(f,position)
% UpperSum(f,position)
%   f        [function numberric]
%   position [array]
%
% make by WitsanuP
n = length(position);
riemannsum = 0;
for i=1:n-1;
    %delta*high
    riemannsum = riemannsum + (position(i+1)-position(i))*f(position(i+1));
end
disp(['Upper sum is ',num2str(riemannsum)])
