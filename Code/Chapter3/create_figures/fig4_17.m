addpath('../../Chapter 1')
clear variables
%% Figure 4.17a
load('../data/fig4_17a.mat')

logplot=true;
x=w_range; y=FRbar; legend_entries=job_distributions;
legend_loc='northeast'; xLab='$w$'; yLab='$\bar F_R(w)$';
yLim=[ 10^(-2), 1]; xLim=[0, 20]; filename='../figures/fig4_17a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.17a
load('../data/fig4_17b.mat')

logplot=true;
x=w_range; y=FRbar; legend_entries=job_distributions;
legend_loc='southeast'; xLab='$w$'; yLab='$\bar F_R(w)$';
yLim=[ 10^(-2), 1]; xLim=[0, 20]; filename='../figures/fig4_17b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);