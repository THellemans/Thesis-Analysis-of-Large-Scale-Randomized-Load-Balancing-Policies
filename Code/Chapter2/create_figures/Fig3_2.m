addpath('../../Chapter 1')
load('../data/fig3_2.mat')

logplot=false;
x=lam_iter; y=(ER_LL)./(ER_SQ); legend_entries={'$d=2$','$d=3$','$d=4$','$d=5$'};
legend_loc='best'; xLab='$\lambda$'; yLab='$E[R_\lambda^{(LL(d))}]/E[R_\lambda^{(SQ(d))}]$';
yLim=[0.3,1.1]; xLim=[0,1]; filename='../figures/fig3_2a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, false);


y=(ER_LL-1)./(ER_SQ-1); yLab='$E[W_\lambda^{(LL(d))}]/E[W_\lambda^{(SQ(d))}]$'; legend_loc='northeast'; 
filename='../figures/fig3_2b.pdf'; yLim=[0.1,1]; xlim([0.5,1]);
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, false);

