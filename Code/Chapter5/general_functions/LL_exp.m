function [Fbar, FRbar, ER] = LL_exp(rho, d, w_range, tol)
%


Fbar=(rho+(rho^(1-d)-rho)*exp((d-1)*w_range)).^(1/(1-d));
FRbar=(rho^d+(1-rho^d)*exp((d-1)*w_range)).^(1/(1-d));
if d==2
    ER=-log(1-rho^2)/(rho^2);
else
    ER=0;
    n=0;
    while true
        temp=rho^(d*n)/(1+n*(d-1));
        ER=ER+temp;
        if temp<tol
            break
        end
        n=n+1;
    end
end

end