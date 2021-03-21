addpath('../../Chapter 1')
clear variables
%% Figure 4.22a
load('../data/fig4_22a.mat')

logplot=false;
x=SCV_iter; y=ER; legend_entries={"$\lambda=0.4$", "$\lambda=0.5$", "$\lambda=0.6$", "$\lambda=0.7$", "$\lambda=0.8$"};
legend_loc='northeast'; xLab='$SCV$'; yLab='$E[R]$';
yLim=[0.5, 4]; xLim=[0, 1]; filename='../figures/fig4_22a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);


%% Figure 4.22b
load('../data/fig4_22b.mat')

logplot=false;
x=SCV_iter; y=ER; legend_entries={"$\lambda=0.4$", "$\lambda=0.5$", "$\lambda=0.6$", "$\lambda=0.7$", "$\lambda=0.8$"};
legend_loc='northeast'; xLab='SCV'; yLab='E[R]';
yLim=[0.2, 1.4]; xLim=[0, 40]; filename='../figures/fig4_22b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);