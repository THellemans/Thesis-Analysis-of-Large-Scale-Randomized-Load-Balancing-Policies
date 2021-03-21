addpath('../general_functions')
addpath('../../chapter 1')
addpath('../simulation_code')


%% Generate data for Table
clear variables
N_iter=[10 20 30 50 100];
d=2;
lam_iter=[0.7 0.9 0.95];
jtype=1; % Exp(1) jobs
sp1=0; sp2=0;
nruns=40;
svals=linspace(0,50,40);
w_range=linspace(0,80,10^5);
dw=w_range(2)-w_range(1);
tol=10^(-8);
ER_lim=zeros(size(lam_iter));
ER_finite=zeros(length(lam_iter), length(N_iter));

for i = 1:length(lam_iter)
    lam=lam_iter(i);
    ER_lim(i) = LL_ER_exponential(lam, d, tol);
    for j = 1:length(N_iter)
        N=N_iter(j); runlen=10^8/N;
        [~, ~, ~, mwloads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,svals,nruns,runlen);
        ER_finite(i,j)=mean(mwloads)/lam;
        save('../data/fig9.mat', 'ER_finite', 'ER_lim', 'N_iter', 'lam_iter')
    end
end
