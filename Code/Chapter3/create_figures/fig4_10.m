addpath('../../Chapter 1')
%% Figure 4.10a
load('../data/fig4_10a.mat')

logplot=false;
x=lam_iter; y=Fbar0_holder; legend_entries={'Exponential', 'Deterministic', 'Bounded Pareto', 'Hyperexponential'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$\bar F(0)$';
yLim=[0.7, 1]; xLim=[0.5, 0.87]; filename='../figures/fig4_10a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.10b
load('../data/fig4_10b.mat')

logplot=false;
x=lam_iter; y=Fbar0_holder; legend_entries={'$d=2$', '$d=3$', '$d=4$', '$d=5$'};
legend_loc='southeast'; xLab='$\lambda$'; yLab='$\bar F(0)$';
yLim=[0, 1]; xLim=[0, 1]; filename='../figures/fig4_10b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);