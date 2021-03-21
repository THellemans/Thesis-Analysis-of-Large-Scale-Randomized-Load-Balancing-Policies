function [ Fbar, FRbar, MRT, flag ] = get_MRT_delay_PHD(lam, delta, d, w_range, g, Gbar, alpha, A, tol,  lb, ub)
%

flag=false;
[ Fbar ] = find_Fbar_identical_delay_PHD(lam, delta, d, w_range, Gbar, alpha, A, tol,  lb, ub);
if Fbar(1) > 1-10^(-5)
    flag=true;
end
Gbar=Gbar(1:length(Fbar));
g=g(1:length(Fbar));
FRbar=Gbar+convolution(Fbar.^d, g, w_range(2)-w_range(1));
MRT=trapz(FRbar)*(w_range(2)-w_range(1));

end