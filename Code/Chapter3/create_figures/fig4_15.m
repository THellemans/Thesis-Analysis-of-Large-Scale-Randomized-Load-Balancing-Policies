addpath('../../Chapter 1')
clear variables
%% Figure 4.15a
load('../data/fig4_15a.mat')

logplot=false;
x=lam_iter; y=varR; legend_entries={'$d=2$', '$d=3$', '$d=4$', '$d=5$'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='Var(R)';
yLim=[0, 1]; xLim=[0, 0.8]; filename='../figures/fig4_15a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.15b
load('../data/fig4_15b.mat')
logplot=false;

x=lam_iter; y=varR;
legend_entries={'$d=2$' ,'$d=3$' ,'$d=4$' ,'$d=5$'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='';
yLim=[0.8, 5]; xLim=[0, 1]; filename='../figures/fig4_15b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);