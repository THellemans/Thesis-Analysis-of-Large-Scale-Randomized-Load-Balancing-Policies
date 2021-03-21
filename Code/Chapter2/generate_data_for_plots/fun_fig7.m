function [y] = fun_fig7(lam, d, w_range, tau, alpha, A, g, Gbar, SCV, qbound, tol)
%

[~, ~, ER_LL] = LL_analysis_delayed_PH(lam, d, w_range, tau, alpha, A, g, Gbar);
[~, ER_SQ] = SQ_PH(lam, d, qbound, SCV, tol);

y=ER_LL-ER_SQ;

end