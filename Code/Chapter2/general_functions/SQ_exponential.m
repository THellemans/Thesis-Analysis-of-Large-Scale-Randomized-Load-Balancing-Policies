function [u, ER] = SQ_exponential(lam, d, tol)
%

u=zeros(1,10^4);
u(1)=1;
for n=1:(10^4-1)
    u(n+1)=lam*u(n)^d;
    if u(n)<tol
        break
    end
end
EW=sum(u(2:end));

%Little's Law
ER=EW/lam;

end