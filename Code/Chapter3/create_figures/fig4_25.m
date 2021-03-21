addpath('../../Chapter 1')
clear variables
%% Figure 4.25a
load('../data/fig4_25.mat')

logplot=false;
x=d_iter; y=lam_max; legend_entries=job_distributions;
legend_loc='east'; xLab='$d$'; yLab='$\lambda_{\max}$';
yLim=[0, 2]; xLim=[0, 50]; filename='../figures/fig4_25a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% FIgure 4.25b

logplot=false;
x=d_iter; y=[lam_max(3,:); 1./EminGtimesd_BoundedPareto]; legend_entries={"$\lambda_{\max}$", "$1/(E[\min_{i=1}^d \{G_i\}] \cdot d)$"};
legend_loc='northeast'; xLab='$d$'; yLab='';
yLim=[0, 1.4]; xLim=[0, 50]; filename='../figures/fig4_25b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);