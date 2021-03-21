function [Fbar, FRbar, ER] = LL_analysis_deterministic(lam, d, w_range)
% 

dw=w_range(2)-w_range(1);
N=length(w_range);
Fbar=zeros(size(w_range));
FRbar=zeros(size(w_range));
Fbar(1)=lam;

n_tau=find(w_range < 1, 1, 'last' );

for n = 1:n_tau
    Fbar(n+1)=Fbar(n)-lam*dw*(1-Fbar(n)^d);
end
for n = (n_tau+1):(N-1)
    Fbar(n+1)=Fbar(n)-lam*dw*(Fbar(n-n_tau)^d-Fbar(n)^d);
end
Fbar=max(Fbar, 0);

for n=1:n_tau
    FRbar(n)=1;
end
for n=n_tau+1:N
    FRbar(n)=Fbar(n-n_tau)^d;
end

ER=trapz(FRbar)*dw;

end