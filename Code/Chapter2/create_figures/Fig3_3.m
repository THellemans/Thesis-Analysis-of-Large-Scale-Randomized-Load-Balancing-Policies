clear all
load('../data/fig3_3.mat')

logplot=true;
x=w_range; y=[FRbar_LL(1:3,:); FRbar_SQ(1:3,:)]; legend_entries={'$LL(2)$','$LL(3)$','$LL(4)$','$SQ(2)$','$SQ(3)$','$SQ(4)$'};
legend_loc='southwest'; xLab='$w$'; yLab='$\bar F_R(w)$';
yLim=[10^(-9),1]; xLim=[0,20]; filename='../figures/fig3_3a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

logplot=false;
legend_entries={'$d=2$','$d=3$','$d=4$','$d=5$'};
y=FRbar_SQ./FRbar_LL; yLab='$\bar F_R^{(SQ(d))}(w)/\bar F_R^{(LL(d))}(w)$'; legend_loc='northwest'; 
filename='../figures/fig3_3b.pdf'; yLim=[0,100]; xlim([0,20]);
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);