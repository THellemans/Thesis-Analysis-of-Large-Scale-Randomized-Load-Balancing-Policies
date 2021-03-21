addpath('../general_functions')
addpath('../../Chapter 1')

clear variables

%% Figure 5.3 : -E[W] / log(1-lam) and -E[W] / log(1-lam^d) for LL(d) with various values of d.
d_iter = 4:2:12; K=2;
lam_range = linspace(0.3,1-10^(-4), 200);
w_range = linspace(0,60,10^5);
Gbar = exp(-w_range); g = exp(-w_range);
tol=10^(-8);
EW=zeros(length(d_iter), length(lam_range));
EW_quot = zeros(length(d_iter), length(lam_range));

for i=1:length(d_iter)
    d = d_iter(i);
    for j = 1:length(lam_range)
        lam=lam_range(j);
        [p] = compute_p_JIQdK(lam, d, K);
        [~, ~, EW(i,j)] = LLdK_exp( lam, d, K, Gbar, g, w_range );
        EW_quot1(i,j) = - EW(i,j) / log(1-lam);
        EW_quot2(i,j) = - EW(i,j) / log(p);
    end
end

save('../data/fig5_3.mat', 'd_iter', 'K', 'lam_range', 'w_range', 'EW_quot1', 'EW_quot2')
