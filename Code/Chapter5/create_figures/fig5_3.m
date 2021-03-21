addpath('../general_functions')

load('../data/fig5_3.mat')

%% figure 5_3a
x=lam_range; y=EW_quot1; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northwest';
xLab='$\lambda$'; yLab='$\frac{- E[W_\lambda]}{\log(1-\lambda)}$'; xLim=[0, 1]; yLim=[0, 1]; filename="../figures/fig5_3a.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% figure 5_3b
x=lam_range; y=EW_quot2; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northwest';
xLab='$\lambda$'; yLab='$\frac{- E[W_\lambda]}{\log(1-\lambda^d)}$'; xLim=[0, 1]; yLim=[0, 1]; filename="../figures/fig5_3b.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);