addpath('../../Chapter 1')
clear variables
%% Figure 4.14a
load('../data/fig4_14.mat')

logplot=false;
x=d_iter; y=lam_max(1,:); legend_entries={'$\lambda_{\max}^{det}$'};
legend_loc='northeast'; xLab='$d$'; yLab='$\lambda_{\max}$';
yLim=[0, 1]; xLim=[0, 50]; filename='../figures/fig4_14a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% Figure 4.14b
logplot=false;
x=d_iter; y=lam_max(2:4, :)-lam_max(1,:); 
legend_entries={'$\lambda_{\max}^{exp}-\lambda_{\max}^{det}$', '$\lambda_{\max}^{BP} - \lambda_{\max}^{det}$', '$\lambda_{\max}^{HE} - \lambda_{\max}^{det}$'};
legend_loc='northeast'; xLab='$d$'; yLab='';
yLim=[0, 0.06]; xLim=[0, 50]; filename='../figures/fig4_14b.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);