addpath('../../Chapter 1')
clear variables
%% Figure 4.26a
load('../data/fig4_26a.mat')

logplot=true;
x=w_range(w_range < 10); y=FRbar_holder(:, (w_range < 10)); legend_entries={'$d=1$', '$d=2$', '$d=3$', '$d=4$', '$d=5$', '$d=6$'};
legend_loc='southwest'; xLab='$w$'; yLab='$\bar F_R(w)$';
yLim=[ 10^(-10), 1]; xLim=[0, 10]; filename='../figures/fig4_26a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.26b
load('../data/fig4_26b.mat')

logplot=true;
x=w_range; y=FRbar_holder; legend_entries={'$d=1$', '$d=2$', '$d=3$', '$d=4$', '$d=5$', '$d=6$'};
legend_loc='east'; xLab='$w$'; yLab='$\bar F_R(w)$';
yLim=[ 10^(-8), 1]; xLim=[0, 60]; filename='../figures/fig4_26b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);