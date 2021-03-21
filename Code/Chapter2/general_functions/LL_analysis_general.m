function [Fbar, FRbar, ER] = LL_analysis_general(lam, d, w_range, g, Gbar, tol)
% 

dw=w_range(2)-w_range(1);
rho=dw*trapz(Gbar)*lam;
Fbar=rho*exp(-w_range);

while true
    new_Fbar=rho-lam*convolution(1-Fbar.^d, Gbar, dw);
    if max(abs(new_Fbar - Fbar)) < tol
        break
    end
    Fbar=new_Fbar;
end
FRbar=Gbar+convolution(g, Fbar.^d, dw);
ER=trapz(FRbar)*dw;
end