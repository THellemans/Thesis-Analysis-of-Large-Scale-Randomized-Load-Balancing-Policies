addpath('../../Chapter 1')
clear variables
%% Figure 4.23a
% Quotient of Figure 4.12a and 4.21a
load('../data/fig4_12a.mat')
ER_eq=ER;
load('../data/fig4_21a.mat')
ER_iid=ER;

logplot=false;
x=SCV_iter; y=ER_eq ./ ER_iid; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northwest'; xLab='SCV'; yLab='$E[R_{Red_{eq}}]/E[R_{Red_{iid}}]$';
yLim=[1, 7]; xLim=[0, 1]; filename='../figures/fig4_23a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% Figure 4.23b
% Quotient of Figure 4.12b and 4.21b
load('../data/fig4_12b.mat')
ER_eq=ER;
load('../data/fig4_21b.mat')
ER_iid=ER;

logplot=false;
x=SCV_iter; y=ER_eq ./ ER_iid; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northwest'; xLab='SCV'; yLab='$E[R_{Red_{eq}}]/E[R_{Red_{iid}}]$';
yLim=[0, 35]; xLim=[0, 40]; filename='../figures/fig4_23b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);