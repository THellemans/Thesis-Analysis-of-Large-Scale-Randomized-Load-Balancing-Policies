function [Fbar, FRbar, ER] = LL_analysis_delayed_PH(lam, d, w_range, tau, alpha, A, g, Gbar)
% 

m=length(A);
dw=w_range(2)-w_range(1);
N=length(w_range);
Fbar=zeros(size(w_range));
FRbar=zeros(size(w_range));
Fbar(1)=lam*(tau+alpha*(-A)^(-1)*ones(m,1)); FRbar(1)=1;
if Fbar(1) >= 1
    ER=99999999;
    return
end
if tau == 0
    n_tau=0;
else
    n_tau=find(w_range < tau, 1, 'last' );
end
h=zeros(m, length(w_range));
for n = 1:n_tau
    Fbar(n+1)=Fbar(n)-lam*dw*(1-Fbar(n)^d);
    h(:, n+1)=h(:, n)+dw*((1-Fbar(n)^d)*ones(m,1)+A*h(:,n));
end

for n = (n_tau+1):(N-1)
    Fbar(n+1)=Fbar(n)-lam*dw*((1-Fbar(n)^d)+alpha*A*h(:, n-n_tau));
    h(:, n+1)=h(:, n)+dw*((1-Fbar(n)^d)*ones(m,1)+A*h(:,n));
end
Fbar=max(Fbar,0);
Gbar=circshift(Gbar, n_tau);
g=circshift(g, n_tau);
Gbar(1:n_tau)=1;
g(1:n_tau)=0;
FRbar=Gbar+convolution(g, Fbar.^d, dw);
ER=trapz(FRbar)*dw;

end