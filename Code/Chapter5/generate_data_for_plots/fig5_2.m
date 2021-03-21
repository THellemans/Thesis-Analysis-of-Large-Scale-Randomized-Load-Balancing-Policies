addpath('../general_functions')
addpath('../../Chapter 1')

%% Figure 5.2a : LL(2) with various \lambda values.
d=2;
lam_iter = [1-10^(-2), 1-10^(-6), 1-10^(-10), 1-10^(-14)];
w_range = linspace(0,60,10^5);
tol=10^(-6);
Fbar=zeros(length(lam_iter), length(w_range));

for i=1:length(lam_iter)
    lam=lam_iter(i);
    [Fbar(i,:), ~, ~] = LL_exp(lam, d, w_range, tol);
end

save('../data/fig5_2a.mat', 'd', 'lam_iter', 'w_range', 'Fbar')

%% Figure 5.2a : LL(d) for lambda = 1- 10^(-14) and d = 2,3,4,5
d_iter=2:5;
lam = 1-10^(-16);
w_range = linspace(0,60,10^5);
tol=10^(-6);
Fbar=zeros(length(lam_iter), length(w_range));

for i=1:length(d_iter)
    d=d_iter(i);
    [Fbar(i,:), ~, ~] = LL_exp(lam, d, w_range, tol);
end

save('../data/fig5_2b.mat', 'd_iter', 'w_range', 'lam', 'Fbar')