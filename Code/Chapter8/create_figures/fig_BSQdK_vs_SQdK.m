addpath('../../Chapter 1')
load('../data/BSQdK_vs_SQdK1.mat')

logplot=false;
x=K_range; y=heavy_frac; legend_entries={'$\frac{d}{K}=2$','$\frac{d}{K}=3$','$\frac{d}{K}=4$','$\frac{d}{K}=5$'};
legend_loc='northeast'; xLab='$K$'; yLab='$\frac{\log(\zeta)}{\log(d/K)}$';
yLim=[1,1.6]; xLim=[1,10]; filename='../figures/fig_BSQdK_vs_SQdK1.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, false);

addpath('../../Chapter 1')
load('../data/BSQdK_vs_SQdK2.mat')

logplot=false;
x=dfracK_range; y=heavy_frac; legend_entries={'$K=2$','$K=3$','$K=4$','$K=5$'};
legend_loc='northeast'; xLab='$\frac{d}{K}$'; yLab='$\frac{\log(\zeta)}{\log(d/K)}$';
yLim=[1,1.6]; xLim=[1,10]; filename='../figures/fig_BSQdK_vs_SQdK2.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, false);
