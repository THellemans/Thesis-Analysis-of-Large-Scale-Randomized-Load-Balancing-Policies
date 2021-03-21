addpath('../../Chapter 1')
clear variables
%% Figure 4.20a
load('../data/fig4_20a.mat')

logplot=false;
x=lam_iter; y=ER; legend_entries=job_distributions;
legend_loc='northwest'; xLab='$\lambda$'; yLab='$E[R]$';
yLim=[0, 2.5]; xLim=[0, 1.6]; filename='../figures/fig4_20a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.20b
load('../data/fig4_20b.mat')

logplot=false;
x=lam_iter; y=ER; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$E[R]$';
yLim=[0, 2.4]; xLim=[0, 1.5]; filename='../figures/fig4_19b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);