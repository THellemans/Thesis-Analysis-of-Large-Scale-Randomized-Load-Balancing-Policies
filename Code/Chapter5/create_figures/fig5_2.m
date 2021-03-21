addpath('../general_functions')

load('../data/fig5_2a.mat')

%% figure 5_2a
x=w_range; y=Fbar; legend_entries={"$\lambda = 1-10^{-2}$", "$\lambda = 1-10^{-4}$", "$\lambda = 1-10^{-8}$", "$\lambda = 1-10^{-16}$"};
legend_loc='northeast';
xLab='$w$'; yLab='$\bar F(w)$'; xLim=[0, 60]; yLim=[0, 1]; filename="../figures/fig5_2a.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%% figure 5_2b
load('../data/fig5_2b.mat')
x=w_range; y=Fbar; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=5$"};
legend_loc='northeast';
xLab='$w$'; yLab='$\bar F(w)$'; xLim=[0, 60]; yLim=[0, 1]; filename="../figures/fig5_2b.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);