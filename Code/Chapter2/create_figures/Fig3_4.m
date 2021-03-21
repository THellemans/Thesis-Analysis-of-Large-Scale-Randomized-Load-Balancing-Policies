addpath('../../Chapter 1')

clear all
load('../data/fig3_4a.mat')
% Figure 3.4a
logplot=false;
x=lam_iter; y=ER_SQ./ER_LL; legend_entries={'$SCV=1$','$SCV=2$','$SCV=5$','$SCV=10$', 'SCV=20', 'SCV=40'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$E[R_\lambda^{(SQ(2))}(\lambda)/E[R_\lambda^{(LL(2))}(\lambda)]$';
yLim=[1,2]; xLim=[0,1]; filename='../figures/fig3_4a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%Figure 3.4b
clear all
load('../data/fig3_4b.mat')
logplot=false;
x=lam_iter; y=ER_SQ./ER_LL; legend_entries={'$SCV=0$','$SCV=1/16$','$SCV=1/8$','$SCV=1/4$', 'SCV=1/2', 'SCV=1'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$E[R_\lambda^{(SQ(2))}(\lambda)]/E[R_\lambda^{(LL(2))}(\lambda)]$';
yLim=[1,1.3]; xLim=[0,1]; filename='../figures/fig3_4b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);