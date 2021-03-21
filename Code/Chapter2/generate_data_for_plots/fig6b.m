addpath('../general_functions')
addpath('../../chapter 1')
clear variables

%% Fig 6b
tol=10^(-6);
qbound=100;
lam_iter=linspace(0.001,0.999,10^3);
SCV=20;
w_range=linspace(0,150,10^5);
[ alpha, A ] = hyperexponential_init_alphaA( 1, SCV, 1/2 );
[ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
d_iter=[2 3 4 5];

tau_equality=zeros(length(d_iter), length(lam_iter));

for d_i = 1:length(d_iter)
    d=d_iter(d_i);
    for lam_i = 1:length(lam_iter)
        lam=lam_iter(lam_i);
        f=@(tau) fun_fig7(lam, d, w_range, tau, alpha, A, g, Gbar, SCV, qbound, tol);
        [ tau_equality(d_i, lam_i) ] = bisection_method(f,0,min(0.5, 1/lam-1),tol);
    end
    save('../data/fig6b.mat', 'lam_iter', 'd_iter', 'SCV', 'w_range', 'tau_equality')
end