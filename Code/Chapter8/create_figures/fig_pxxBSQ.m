addpath('../../Chapter 1')
load('../data/fig_px_BSQdK1.mat')

logplot=false;
x=xx; y=pxx; legend_entries={'$K=2$','$K=3$','$K=4$','$K=5$','$K=6$'};
legend_loc='best'; xLab='$x$'; yLab='$p(x)$';
yLim=[-1,1]; xLim=[1,2]; filename='../figures/fig_px_BSQdK1.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, false);


addpath('../../Chapter 1')
load('../data/fig_px_BSQdK2.mat')

logplot=false;
x=xx; y=pxx; legend_entries={'$K=2$','$K=3$','$K=4$','$K=5$','$K=6$'};
legend_loc='best'; xLab='$x$'; yLab='$p(x)$';
yLim=[-5,1]; xLim=[1,4]; filename='../figures/fig_px_BSQdK2.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, false);


