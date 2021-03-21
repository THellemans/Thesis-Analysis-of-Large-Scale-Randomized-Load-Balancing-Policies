addpath('../general_functions')
addpath('../../chapter 1')
clear variables

tol=10^(-10);
lam_iter=linspace(0.5,0.999999,10^4);
d_iter=[2 3 4 5];

ER_LL=zeros(length(d_iter), length(lam_iter));
ER_SQ=zeros(length(d_iter), length(lam_iter));
for d_i =1:length(d_iter)
    d=d_iter(d_i);
    for lam_i = 1:length(lam_iter)
        lam=lam_iter(lam_i);
        ER_LL(d_i, lam_i)=LL_ER_exponential(lam, d, tol);
        [~, ER_SQ(d_i, lam_i)] = SQ_exponential(lam, d, tol);
    end
end

save('../data/fig3.mat', 'lam_iter', 'd_iter', 'ER_LL', 'ER_SQ')