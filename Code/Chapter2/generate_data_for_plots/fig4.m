addpath('../general_functions')
addpath('../../chapter 1')
clear variables

tol=10^(-12);
lam=0.95;
w_range=linspace(0,20,10^5);
d_iter=[2 3 4 5];

FRbar_LL=zeros(length(d_iter), length(w_range));
FRbar_SQ=zeros(length(d_iter), length(w_range));
for d_i =1:length(d_iter)
    d=d_iter(d_i);
    [~, FRbar_LL(d_i,:)] = FRbar_LL_exp(lam, d, w_range);
    [FRbar_SQ(d_i, :)] = FRbar_SQ_exponential(lam, d, w_range, tol);
end

save('../data/fig4.mat', 'lam', 'd', 'w_range', 'FRbar_LL', 'FRbar_SQ')