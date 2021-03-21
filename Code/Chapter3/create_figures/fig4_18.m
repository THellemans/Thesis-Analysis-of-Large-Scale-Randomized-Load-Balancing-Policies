addpath('../../Chapter 1')
clear variables
%% Figure 4.18a
load('../data/fig4_18.mat')

logplot=false;
x=delta_range; y=Fbar0_holder; legend_entries={'$SCV=1/2$', '$SCV=1$', '$SCV=2$', '$SCV=3$'};
y(y==0)=3;
legend_loc='southeast'; xLab='$\delta$'; yLab='$\bar F(0)$';
yLim=[0.89, 1]; xLim=[0, 3.5]; filename='../figures/fig4_18a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.18b
logplot=false;
x=delta_range; y=MRT_holder; legend_entries={'$SCV=1/2$', '$SCV=1$', '$SCV=2$', '$SCV=3$'};
y(y==0)=100;
legend_loc='southeast'; xLab='$\delta$'; yLab='$E[R]$';
yLim=[2, 17]; xLim=[0, 3.5]; filename='../figures/fig4_18b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);