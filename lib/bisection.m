function m = bisection(f,a,b)
% Solves for f(m)=0 overan inital intercal [a,b].
i=0;
ym=1;
ya=f(a);
yb=f(b);
while(i<50 && abs(ym)>eps)
    m=(a+b)/2;
    ym=f(m);
    if ym*ya<0
        b=m
        yb=ym;
    elseif ym*yb<0
        a=m;
        ya=ym;
    else
        ym=0;
    end
    i=i+1
end
end