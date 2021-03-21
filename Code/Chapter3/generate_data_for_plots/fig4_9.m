clear variables

addpath('../../Chapter 1')
addpath('../simulation_code')
addpath('../general_functions/Identical_jobs/Stability')
addpath('../general_functions/Identical_jobs')

%% First, we need to compute lam_max.
% Using some trial-and-error we obtain "rough estimates" for lam_max, these
% can then be refined using the method proposed in the paper.
Fbar0=1-10^(-6);
d=2;
w_range=linspace(0,100,10^7);
tol=10^(-5);

%Dist 1 : Deterministic
[ lam_max_det ] = find_lam_max_det( d, w_range, tol,  0.8, 0.85, Fbar0);

%Dist 2 : Exponential
alpha=1; A=-1;
[ lam_max_exp ] = find_lam_max_PHD( d, w_range, alpha, A, tol,  0.8, 0.9, Fbar0);

%Dist 3 : Hyperexponential
w_range=linspace(0,300,10^7);
[ alpha, A ] = hyperexponential_init_alphaA( 1, 9, 1/2 );
[lam_max_HExp] = find_lam_max_PHD( d, w_range, alpha, A, tol,  0.8, 0.95, Fbar0);

%Dist 4 : Bounded Pareto
Fbar0=1-10^(-4);
d=2;
tol=10^(-5);
lb=0.8;
ub=0.9;
w_range=linspace(0,400,4*10^5);
sp1=0.2; sp2=72; sp3=1.1;
[Gbar] = 1 - pareto_cdf(w_range, sp1, sp2, sp3);
[g] = pareto_pdf(w_range, sp1, sp2, sp3);
[ lam_max_BP ] = find_lam_max( d, w_range, Gbar, g, tol,  lb, ub, Fbar0);
disp("Computed the lam maxes")
save('../data/data_lam_max.mat','lam_max_det','lam_max_exp','lam_max_HExp','lam_max_BP')

%% Now we execute the simulations based on the obtained lam_max values.
load('../data/data_lam_max.mat')
d=2; N=300;
% Exponential Job Sizes
disp("Exp(1)")
lam=lam_max_exp-0.001;
jtype=1; sp1=0; sp2=0; sp3=0; nruns=10; runlen=10^7/N;
[wloads_holder, times]=simul_mwload_mex(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);
save('../data/fig4_9a1.mat', 'times', 'wloads_holder')

lam=lam_max_exp+0.001;
jtype=1; sp1=0; sp2=0; sp3=0; nruns=10; runlen=10^7/N;
[wloads_holder, times]=simul_mwload_mex(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);
save('../data/fig4_9b1.mat', 'times', 'wloads_holder')

% Determonistic Job Sizes
disp("Deterministic")
d=2; N=300;
lam=lam_max_det-0.001;
jtype=4; sp1=0; sp2=0; sp3=0; nruns=10  ; runlen=10^7/N;
[wloads_holder, times]=simul_mwload_mex(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);
save('../data/fig4_9a2.mat', 'times', 'wloads_holder')

lam=lam_max_det+0.001;
jtype=4; sp1=0; sp2=0; sp3=0; nruns=10; runlen=10^7/N;
[wloads_holder, times]=simul_mwload_mex(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);
save('../data/fig4_9b2.mat', 'times', 'wloads_holder')

% Bounded Pareto
disp("Bounded Pareto")
lam=lam_max_BP-0.001;
jtype=3; sp1=0.2; sp2=72; sp3=1.1; nruns=10; runlen=10^7/N;
[wloads_holder, times]=simul_mwload_mex(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);
save('../data/fig4_9a3.mat', 'times', 'wloads_holder')

lam=lam_max_BP+0.001;
jtype=4; sp1=0.2; sp2=72; sp3=1.1; nruns=10; runlen=10^7/N;
[wloads_holder, times]=simul_mwload_mex(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);
save('../data/fig4_9b3.mat', 'times', 'wloads_holder')