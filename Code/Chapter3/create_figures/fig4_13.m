addpath('../../Chapter 1')
clear variables
%% Figure 4.13a
load('../data/fig4_13a.mat')

logplot=false;
x=SCV_iter; y=ER; legend_entries={'$\lambda=0.4$', '$\lambda=0.5$', '$\lambda=0.6$', '$\lambda=0.7$'};
legend_loc='west'; xLab='SCV'; yLab='$E[R]$';
yLim=[1, 5]; xLim=[0, 1]; filename='../figures/fig4_13a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% Figure 4.13b
load('../data/fig4_13b.mat')

logplot=false;
x=SCV_iter; y=ER; 
legend_entries={'$\lambda=0.4$', '$\lambda=0.5$', '$\lambda=0.6$', '$\lambda=0.7$'};
legend_loc='northwest'; xLab='SCV'; yLab='$E[R]$';
yLim=[1, 30]; xLim=[0, 40]; filename='../figures/fig4_13b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);