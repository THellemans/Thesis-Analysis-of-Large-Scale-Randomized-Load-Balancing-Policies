addpath('../../Chapter 1')

%% Create Figure 4.7a
clear all
close all

load("../data/fig4_7a.mat")
x=Fbar0_iter;
y=inf_Fbar;
legend_entries=cell(1, length(d_iter));
for i=1:length(d_iter)
    legend_entries{i}="$d="+int2str(d_iter(i))+"$";
end
legend_loc="northwest";
xLab="$\bar F(0)$";
yLab="$\inf_{w>0} \bar F(w)$";
xLim=[0,1];
yLim=[-3, 1.4];
logplot=false;

[h] = make_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, logplot);
plot(Fbar0_iter, zeros(size(Fbar0_iter)), 'LineWidth', 1, 'color', 'k','HandleVisibility', 'off');
save_fig(h, "../figures/fig4_7a.pdf")


%% Create Figure 4.7b
clear all
close all

load("../data/fig4_7b.mat")
x=Fbar0_iter;
y=inf_Fbar;
legend_entries=cell(1, length(lam_iter));
for i=1:length(lam_iter)
    legend_entries{i}="$\lambda="+string(lam_iter(i))+"$";
end
legend_loc="southeast";
xLab="$\bar F(0)$";
yLab="$\inf_{w>0} \bar F(w)$";
xLim=[0,1];
yLim=[-2, 1.2];
logplot=false;

[h] = make_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, logplot);
plot(Fbar0_iter, zeros(size(Fbar0_iter)), 'LineWidth', 1, 'color', 'k','HandleVisibility', 'off');
save_fig(h, "../figures/fig4_7b.pdf")