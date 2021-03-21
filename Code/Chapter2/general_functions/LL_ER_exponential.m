function [ER] = LL_ER_exponential(lam, d, tol)
%

if d==2
    EW=-log(1-lam^2)/lam;
elseif d==3
    EW=-1/sqrt(lam)*log(sqrt(1-lam^3)/(lam^(3/2)+1));
else
    EW=0;
    n=0;
    while true
        temp=lam^(d*n+1)/(1+n*(d-1));
        EW=EW+temp;
        if temp < tol
            break
        end
        n=n+1;
    end
end

% Little's law
ER=EW/lam;

end