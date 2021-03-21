addpath('../../Chapter 1')
clear variables
%% Figure 4.11a
load('../data/fig4_11a.mat')

logplot=false;
x=lam_iter; y=ER; legend_entries={'Exponential', 'Deterministic', 'Bounded Pareto', 'Hyperexponential'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$E[R]$';
yLim=[0, 12]; xLim=[0, 1]; filename='../figures/fig4_11a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.10b
load('../data/fig4_11b.mat')

logplot=false;
x=lam_iter; y=ER; 
legend_entries={'$d=2$', '$d=3$', '$d=4$', '$d=5$'};
legend_loc='southeast'; xLab='$\lambda$'; yLab='$E[R]$';
yLim=[0, 10]; xLim=[0, 1]; filename='../figures/fig4_10b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);