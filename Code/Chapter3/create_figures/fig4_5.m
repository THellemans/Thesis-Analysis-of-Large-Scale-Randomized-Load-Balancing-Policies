addpath('../../Chapter 1')
%% Figure 4.5a
load('../data/fig4_5a.mat')

logplot=true;
x=1:35; y=sup_norm_error(:, 1:35); legend_entries={'$d=2$','$d=3$','$d=4$','$d=5$'};
legend_loc='northeast'; xLab='$n$'; yLab='$\| \bar F_n - \bar F_{\infty} \|_{\infty}$';
yLim=[10^(-10),2]; xLim=[0,35]; filename='../figures/fig4_5a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.5b
load('../data/fig4_5b.mat')
x=1:35; y=sup_norm_error(:, 1:35); legend_entries=job_distributions;
legend_loc='northeast'; xLab='$n$'; yLab='$\| \bar F_n - \bar F_{\infty} \|_{\infty}$';
yLim=[10^(-10), 2]; xlim=[0, 35]; filename='../figures/fig4_5b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);