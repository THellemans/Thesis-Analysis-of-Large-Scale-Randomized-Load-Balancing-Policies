addpath('../general_functions')
addpath('../../Chapter 1')
clear variables

%% Figure 5.2a : LL(2) with various \lambda values.
d_iter=2:5;
lam_range = linspace(0.01,1-10^(-8), 400);
w_range = linspace(0,60,10^5);
tol=10^(-6);
EW_quot1 = zeros(length(d_iter), length(lam_range));
EW_quot2 = zeros(length(d_iter), length(lam_range));

for i=1:length(d_iter)
    d=d_iter(i);
    for j=1:length(lam_range)
        lam=lam_range(j);
        [~, ~, ER] = LL_exp(lam, d, w_range, tol);
        EW = ER - 1;
        EW_quot1(i,j) = - EW / log(1-lam);
        EW_quot2(i,j) = - EW / log(1-lam^d);
    end
end

save('../data/fig5_3.mat', 'd_iter', 'lam_range', 'EW_quot1', 'EW_quot2')