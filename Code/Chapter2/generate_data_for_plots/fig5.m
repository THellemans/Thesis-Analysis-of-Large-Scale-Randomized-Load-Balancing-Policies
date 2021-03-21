addpath('../general_functions')
addpath('../../chapter 1')
clear variables

%% Fig 5a
tol=10^(-6);
qbound=100;
lam_iter=linspace(0,0.999,10^3);
SCV_iter=[1 2 5 10 20 40];
w_range=linspace(0,150,10^5);
d=2;

ER_LL=zeros(length(SCV_iter), length(lam_iter));
ER_SQ=zeros(length(SCV_iter), length(lam_iter));

for SCV_i = 1:length(SCV_iter)
    SCV=SCV_iter(SCV_i);
    [ alpha, A ] = hyperexponential_init_alphaA( 1, SCV, 1/2 );
    [ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
    for lam_i = 1:length(lam_iter)
        lam=lam_iter(lam_i);
        [Fbar, FRbar, ER_LL(SCV_i, lam_i)] = LL_analysis_delayed_PH(lam, d, w_range, 0, alpha, A, g, Gbar);
        [~, ER_SQ(SCV_i, lam_i)] = SQ_PH(lam, d, qbound, SCV, tol);
    end
end

save('../data/fig5a.mat', 'lam_iter', 'SCV_iter', 'd', 'w_range', 'ER_LL', 'ER_SQ')

%% Fig 5b
tol=10^(-6);
qbound=20;
lam_iter=linspace(0,0.999,10^3);
SCV_iter=[1/100 1/16 1/8 1/4 1/2 1];
w_range=linspace(0,50,10^5);
d=2;

ER_LL=zeros(length(SCV_iter), length(lam_iter));
ER_SQ=zeros(length(SCV_iter), length(lam_iter));

for SCV_i = 1:length(SCV_iter)
    SCV=SCV_iter(SCV_i);
    k=1/SCV;
    [ alpha, A ] = erlang_init_alphaA(k, k);
    [ g, Gbar ] = erlang_dist(k, k, w_range);
    for lam_i = 1:length(lam_iter)
        lam=lam_iter(lam_i);
        [~, ~, ER_LL(SCV_i, lam_i)] = LL_analysis_delayed_PH(lam, d, w_range, 0, alpha, A, g, Gbar);
        [~, ER_SQ(SCV_i, lam_i)] = SQ_PH(lam, d, qbound, SCV, tol);
    end
end

save('../data/fig5b.mat', 'lam_iter', 'SCV_iter', 'd', 'w_range', 'ER_LL', 'ER_SQ')