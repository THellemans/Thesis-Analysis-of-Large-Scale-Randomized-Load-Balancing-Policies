addpath('../general_functions')
addpath('../../chapter 1')
clear variables

%% Fig 6a

w_range=linspace(0,250,10^6);
tol=10^(-6);
qbound=100;
tau=0.05;
lam_iter=linspace(0,0.94999,10^3);
SCV_iter=[1 2 5 10 20 40];
ER_LL=zeros(length(SCV_iter), length(lam_iter));
ER_SQ=zeros(length(SCV_iter), length(lam_iter));
d=2;

for SCV_i = 1:length(SCV_iter)
    SCV=SCV_iter(SCV_i);
    [ alpha, A ] = hyperexponential_init_alphaA( 1, SCV, 1/2 );
    [ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
    for lam_i = 1:length(lam_iter)
        lam=lam_iter(lam_i);
        [Fbar, FRbar, ER_LL(SCV_i, lam_i)] = LL_analysis_delayed_PH(lam, d, w_range, tau, alpha, A, g, Gbar);
        [~, ER_SQ(SCV_i, lam_i)] = SQ_PH(lam, d, 100, SCV, 10^(-8));
    end
end

save('../data/fig6a.mat', 'lam_iter', 'SCV_iter', 'd', 'w_range', 'ER_LL', 'ER_SQ')