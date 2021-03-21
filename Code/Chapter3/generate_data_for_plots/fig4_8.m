addpath('../general_functions/Identical_jobs')
addpath('../../chapter 1')
addpath('../simulation_code')


%% Generate data for Figure 4.8a
clear variables
close all
N_iter=[10 50 250];
d=2;
lam=0.7;
jtype=1; % Exp(1) jobs
sp1=0; sp2=0; sp3=0; %These values don't matter
w_range=linspace(0,80,10^5);
alpha=1; A=-1; lb=0; ub=1; tol=10^(-10);

% N = infinity
[ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
save('../data/fig4_8a0.mat', 'w_range', 'Fbar')

% N < infinity
svals=linspace(0,10,20);
nruns=40;
for i=1:length(N_iter)
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, conf_loads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen);
    save('../data/fig4_8a'+string(i)+'.mat', 'nruns', 'svals', 'sloads', 'conf_loads', 'w_range', 'Fbar');
end


%% Generate data for Figure 4.8b
clear variables
close all

N_iter=[10 50 250];
d=2;
lam=0.6;
jtype=4; % Deterministic jobs
sp1=0; sp2=0; sp3=0; %These values don't matter
w_range=linspace(0,20,10^5);
lb=0; ub=1; tol=10^(-10);
dw=w_range(2)-w_range(1);

% N = infinity
[ Fbar ] = find_Fbar_deterministic(lam, d, w_range, tol, lb, ub);
save('../data/fig4_8b0.mat', 'w_range', 'Fbar')

% N < infinity
svals=linspace(0,4,20);
nruns=40;
for i=1:length(N_iter)
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, conf_loads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen);
    save('../data/fig4_8b'+string(i)+'.mat', 'nruns', 'svals', 'sloads', 'conf_loads', 'w_range', 'Fbar');
end

%% Generate data for Figure 4.8c
clear variables
close all

N_iter=[10 50 250];
d=2;
lam=0.7;
jtype=3; % Bounded Pareto Job Sizes
sp1=0.2; sp2=72; sp3=1.1;
w_range=linspace(0,200,2*10^4);
lb=0; ub=1; tol=10^(-10);
Gbar=1-pareto_cdf(w_range, sp1, sp2, sp3); g=pareto_pdf(w_range, sp1, sp2, sp3);

% N = infinity
[ Fbar ] = find_Fbar_identical(lam, d, w_range, Gbar, g, tol, lb, ub);
save('../data/fig4_8c0.mat', 'w_range', 'Fbar')

% N < infinity
svals=linspace(0,100,20);
nruns=40;
for i=1:length(N_iter)
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, conf_loads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen);
    save('../data/fig4_8c'+string(i)+'.mat', 'nruns', 'svals', 'sloads', 'conf_loads', 'w_range', 'Fbar');
end

%% Generate data for Figure 4.8c
clear variables
close all

N_iter=[10 50 250];
d=2;
lam=0.7;
jtype=2; % Hyperexponential job sizes
sp1=10; sp2=1/2; sp3=0; % the value of sp3 does not mather.
w_range=linspace(0,200,10^5);
lb=0; ub=1; tol=10^(-10);
[ alpha, A ] = hyperexponential_init_alphaA( 1, sp1, sp2 );

% N = infinity
[ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
save('../data/fig4_8d0.mat', 'w_range', 'Fbar')

% N < infinity
svals=linspace(0,100,20);
nruns=40;
for i=1:length(N_iter)
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, conf_loads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen);
    save('../data/fig4_8d'+string(i)+'.mat', 'nruns', 'svals', 'sloads', 'conf_loads', 'w_range', 'Fbar');
end