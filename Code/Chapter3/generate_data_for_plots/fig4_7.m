addpath('../general_functions/Identical_jobs')
addpath('../../Chapter 1')
clear all

%% Figure 4.7a

lam=0.4;
d_iter=[2 3 4 5];
w_range=linspace(0,50,10^5);
Fbar0_iter=linspace(0,1,10^3);
inf_Fbar=zeros(length(d_iter), length(Fbar0_iter));

for d_i = 1:length(d_iter)
    d=d_iter(d_i);
    for n=1:length(Fbar0_iter)
        Fbar0=Fbar0_iter(n);
        [ Fbar ] = fixed_point_deterministic_full(lam, d, w_range, Fbar0);
        inf_Fbar(d_i, n)=min(Fbar);
    end
end
inf_Fbar(inf_Fbar==-Inf)=-999999;

save('../data/fig4_7a.mat', 'inf_Fbar', 'Fbar0_iter', 'd_iter')


%% Figure 4.7b
clear all

lam_iter=[0.1 0.3 0.5 0.7];
d=2;
w_range=linspace(0,200,10^4);
Fbar0_iter=linspace(0,1,10^3);
inf_Fbar=zeros(length(lam_iter), length(Fbar0_iter));

lb_pareto=0.2;
ub_pareto=72;
alpha=1.1;
Gbar = 1 - pareto_cdf(w_range, lb_pareto, ub_pareto, alpha);
g = pareto_pdf(w_range, lb_pareto, ub_pareto, alpha);

for lam_i = 1:length(lam_iter)
    lam=lam_iter(lam_i);
    for n=1:length(Fbar0_iter)
        Fbar0=Fbar0_iter(n);
        [ Fbar ] = fixed_point_identical_full(lam, d, w_range, Gbar, g, Fbar0);
        inf_Fbar(lam_i, n)=min(Fbar);
    end
end
inf_Fbar(inf_Fbar==-Inf)=-999999;

save('../data/fig4_7b.mat', 'inf_Fbar', 'Fbar0_iter', 'lam_iter')