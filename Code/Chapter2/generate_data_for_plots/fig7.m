addpath('../general_functions')
addpath('../../chapter 1')
addpath('../simulation_code')


%% Generate data for figure 7a
clear variables
N=100;
d_iter=[2 3 4];
lam_iter=[0.95 0.9 0.8];
jtype=1; % Exp(1) jobs
sp1=0; sp2=0;
nruns=40;
runlen=10^7/N;
svals=linspace(0,10,40);
w_range=linspace(0,20,10^5);

for i = 1:3
    d=d_iter(i); lam=lam_iter(i);
    [svals, sloads, sresps, conf_loads, conf_resps, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,0,svals,nruns,runlen);
    [Fbar, FRbar] = FRbar_LL_exp(lam, d, w_range);
    save('../data/fig7a'+string(i)+'.mat', 'svals', 'sloads', 'sresps', 'conf_loads', 'conf_resps', 'mwloads', 'w_range', 'Fbar', 'FRbar')
end

%% Generate data for figure 7b
clear variables
N_iter=[20 100 500];
d=2;
lam=0.95;
jtype=1; % Exp(1) jobs
sp1=0; sp2=0;
nruns=40;
svals=linspace(0,10,40);
w_range=linspace(0,50,10^5);

for i = 1:3
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, sresps, conf_loads, conf_resps, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,0,svals,nruns,runlen);
    [Fbar, FRbar] = FRbar_LL_exp(lam, d, w_range);
    save('../data/fig7b'+string(i)+'.mat', 'svals', 'sloads', 'sresps', 'conf_loads', 'conf_resps', 'mwloads', 'w_range', 'FRbar')
end

%% Generate data for figure 7c
clear variabes
N=100;
d_iter=[2 3 4];
lam_iter=[0.95 0.8 0.8];
jtype=2;
sp1_iter=[20 10 5]; 
sp2=1/2;
nruns=40;
runlen=10^7/N;
svals=linspace(0,100,40);
w_range=linspace(0,200,10^5);

for i = 1:3
    d=d_iter(i); lam=lam_iter(i); sp1=sp1_iter(i);
    [ alpha, A ] = hyperexponential_init_alphaA( 1, sp1, sp2 );
    [ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
    [~, FRbar, ~] = LL_analysis_delayed_PH(lam, d, w_range, 0, alpha, A, g, Gbar);
    [svals, sloads, sresps, conf_loads, conf_resps, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,0,svals,nruns,runlen);
    save('../data/fig7c'+string(i)+'.mat', 'svals', 'sloads', 'sresps', 'conf_loads', 'conf_resps', 'mwloads', 'w_range', 'FRbar')
end

%% Generate data for figure 7d
clear variables
N_iter=[20 100 500];
d=2;
lam=0.95;
jtype=2;
sp1=20;
sp2=1/2;
nruns=40;
svals=linspace(0,100,40);
w_range=linspace(0,200,10^5);
[ alpha, A ] = hyperexponential_init_alphaA( 1, sp1, sp2 );
[ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );

for i = 1:3
    N=N_iter(i);
    runlen=10^7/N;
    [svals, sloads, sresps, conf_loads, conf_resps, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,0,svals,nruns,runlen);
    [~, FRbar, ~] = LL_analysis_delayed_PH(lam, d, w_range, 0, alpha, A, g, Gbar);
    save('../data/fig7d'+string(i)+'.mat', 'svals', 'sloads', 'sresps', 'conf_loads', 'conf_resps', 'mwloads', 'w_range', 'FRbar')
end