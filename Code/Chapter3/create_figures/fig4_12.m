addpath('../../Chapter 1')
clear variables
%% Figure 4.12a
load('../data/fig4_12a.mat')

logplot=false;
x=SCV_iter; y=ER; legend_entries={'$d=2$', '$d=3$', '$d=4$', '$d=5$'};
legend_loc='west'; xLab='SCV'; yLab='$E[R]$';
yLim=[1.2, 1.9]; xLim=[0, 1]; filename='../figures/fig4_12a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% Figure 4.12b
load('../data/fig4_12b.mat')

logplot=false;
x=SCV_iter; y=ER; 
legend_entries={'$d=2$', '$d=3$', '$d=4$', '$d=5$'};
legend_loc='northwest'; xLab='SCV'; yLab='$E[R]$';
yLim=[1, 6]; xLim=[0, 40]; filename='../figures/fig4_12b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);