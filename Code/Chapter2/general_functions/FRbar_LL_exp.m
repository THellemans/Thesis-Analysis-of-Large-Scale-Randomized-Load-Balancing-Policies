function [Fbar, FRbar] = FRbar_LL_exp(lam, d, w_range)
%

Fbar=(lam+(lam^(1-d)-lam)*exp((d-1)*w_range)).^(1/(1-d));
FRbar=(lam^d+(1-lam^d)*exp((d-1)*w_range)).^(1/(1-d));

end