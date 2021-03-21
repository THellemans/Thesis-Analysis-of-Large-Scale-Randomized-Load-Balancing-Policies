addpath('../general_functions')
addpath('../../chapter 1')
addpath('../simulation_code')

%% Generate data for figure 8a
clear variables
N_iter=[20 100 500];
d=2;
lam=0.4;
jtype=3; % Exp(1) jobs
sp1=0; sp2=0;
nruns=40;
svals=linspace(0,200,40);
w_range=linspace(0,400,10^5);
dw=w_range(2)-w_range(1);
Gbar=min(w_range.^(-2),1); g=2*w_range.^-3; g(w_range <=1)=0;
tol=10^(-8);

[~, FRbar, ~] = LL_analysis_general(lam, d, w_range, g, Gbar, tol);
for i = 1:3
    N=N_iter(i); runlen=10^6/N;
    [svals, sloads, sresps, conf_loads, conf_resps, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,0,svals,nruns,runlen);
    save('../data/fig8a'+string(i)+'.mat', 'nruns', 'svals', 'sloads', 'sresps', 'conf_resps', 'conf_loads', 'mwloads', 'w_range', 'FRbar')
end

%% Generate data for figure 3.7b
clear variables
N_iter=[20 100 500];
d=2;
lam=0.9;
jtype=4; % Exp(1) jobs
sp1=0; sp2=0;
nruns=40;
svals=linspace(0,5,40);
w_range=linspace(0,20,10^5);

for i = 1:3
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, sresps, conf_loads, conf_resps, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,svals,nruns,runlen);
    [~, FRbar, ~] = LL_analysis_deterministic(lam, d, w_range);
    save('../data/fig8b'+string(i)+'.mat', 'svals', 'sloads', 'sresps', 'conf_loads', 'mwloads', 'w_range', 'FRbar')
end