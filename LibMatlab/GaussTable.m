function table = GaussTable(x,y)
% make by WitsanuP
n = length(x);
for(i=1:n)
    table(i,1)=x(i);
end
   
for(i=1:n)
    table(i,2)=y(i);
end

for (i=3:n+1)
    for(j=1:n+2-i)
        table(j,i)=-table(j,i-1)+table(j+1,i-1);
    end
end