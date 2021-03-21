addpath('../general_functions')

load('../data/fig5_4.mat')

%% figure 5_4a
x=lam_range; y=EW_quot1; legend_entries={"$d=4, K=2$", "$d=6, K=2$", "$d=8, K=2$", "$d=10, K=2$", "$d=12, K=2$"};
legend_loc='northeast';
xLab='$\lambda$'; yLab='$\frac{- E[W_\lambda]}{\log(1-\lambda)}$'; xLim=[0.3, 1]; yLim=[0, 1]; filename="../figures/fig5_3.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% figure 5_3b
x=lam_range; y=EW_quot2; legend_entries={"$d=4, K=2$", "$d=6, K=2$", "$d=8, K=2$", "$d=10, K=2$", "$d=12, K=2$"};
legend_loc='northeast';
xLab='$\lambda$'; yLab='$\frac{- E[W_\lambda]}{\log(p_\lambda)}$'; xLim=[0.3, 1]; yLim=[0, 1]; filename="../figures/fig5_3.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);