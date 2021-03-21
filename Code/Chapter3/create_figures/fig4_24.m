addpath('../../Chapter 1')
clear variables
%% Figure 4.24a
% Quotient of Figure 4.13a and 4.22a
load('../data/fig4_13a.mat')
ER_eq=ER;
load('../data/fig4_22a.mat')
ER_iid=ER;

logplot=false;
x=SCV_iter; y=ER_eq ./ ER_iid; legend_entries={"$\lambda=0.4$", "$\lambda=0.5$", "$\lambda=0.6$", "$\lambda=0.7$", "$\lambda=0.8$"};
legend_loc='northwest'; xLab='SCV'; yLab='$E[R_{Red_{eq}}]/E[R_{Red_{iid}}]$';
yLim=[1, 4]; xLim=[0, 1]; filename='../figures/fig4_24a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% Figure 4.24b
% Quotient of Figure 4.13a and 4.22a
load('../data/fig4_13b.mat')
ER_eq=ER;
load('../data/fig4_22b.mat')
ER_iid=ER;

logplot=false;
x=SCV_iter; y=ER_eq ./ ER_iid; legend_entries={"$\lambda=0.4$", "$\lambda=0.5$", "$\lambda=0.6$", "$\lambda=0.7$", "$\lambda=0.8$"};
legend_loc='northwest'; xLab='SCV'; yLab='$E[R_{Red_{eq}}]/E[R_{Red_{iid}}]$';
yLim=[0, 70]; xLim=[0, 40]; filename='../figures/fig4_24b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);
