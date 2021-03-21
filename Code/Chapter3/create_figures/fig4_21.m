addpath('../../Chapter 1')
clear variables
%% Figure 4.21a
load('../data/fig4_21a.mat')

logplot=false;
x=SCV_iter; y=ER; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northeast'; xLab='$SCV$'; yLab='$E[R]$';
yLim=[0, 2]; xLim=[0, 1]; filename='../figures/fig4_21a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% Figure 4.21b
load('../data/fig4_21b.mat')

logplot=false;
x=SCV_iter; y=ER; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northeast'; xLab='SCV'; yLab='$E[R]$';
yLim=[0, 0.8]; xLim=[0, 40]; filename='../figures/fig4_21b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);