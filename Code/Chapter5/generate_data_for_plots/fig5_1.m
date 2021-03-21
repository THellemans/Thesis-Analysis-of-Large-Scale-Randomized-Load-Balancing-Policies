addpath('../general_functions')
addpath('../../Chapter 1')

%% Figure 5.1 : SQ(2) with various \lambda values.
d=2;
lam_iter = [1-10^(-2), 1-10^(-6), 1-10^(-10), 1-10^(-14)];
N=100;
u=zeros(length(lam_iter), N);
utilde=zeros(length(lam_iter), N);
ultide_quot = zeros(length(lam_iter), N);


for i=1:length(lam_iter)
    lam=lam_iter(i);
    [u(i,:), ~] = SQ_exp(lam, d, N, lam);
    utilde(i,:) = lam^(1/(1-d)) - u(i,:);
    ultide_quot(i,:) = [utilde(i,2:end) ./ utilde(i,1:end-1), 1];
end

save('../data/fig5_1a.mat', 'd', 'lam_iter', 'u', 'utilde', 'ultide_quot', 'N')

%% Figure 5.1b : SQ(d) for d=2,3,4,5 and lambda = 1 - 10^(-14).
d_iter=[2,3,4,5];
lam=1-10^(-14);
N=100;
u=zeros(length(d_iter), N);
utilde=zeros(length(d_iter), N);
ultide_quot = zeros(length(d_iter), N);


for i=1:length(d_iter)
    d=d_iter(i);
    [u(i,:), ~] = SQ_exp(lam, d, N, lam);
    utilde(i,:) = lam^(1/(1-d)) - u(i,:);
    ultide_quot(i,:) = [utilde(i,2:end) ./ utilde(i,1:end-1), 1];
end

save('../data/fig5_1b.mat', 'd', 'lam_iter', 'u', 'utilde', 'ultide_quot', 'N')