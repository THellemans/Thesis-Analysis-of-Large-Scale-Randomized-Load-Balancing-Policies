clear all
load('../data/fig3_5a.mat')
% Figure 3.5a
logplot=false;
x=lam_iter; y=ER_SQ./ER_LL; legend_entries={'$SCV=1$','$SCV=2$','$SCV=5$','$SCV=10$', '$SCV=20$', '$SCV=40$'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$E[R_\lambda^{(SQ(2))}]/E[R_{\lambda, \tau}^{(LL(2))}]$';
yLim=[0.8,2]; xLim=[0,1]; filename='../figures/fig3_5a.pdf';
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot);

%Figure 3.5b
clear all
load('../data/fig3_5b.mat')
logplot=false;
lam_stab = (1-lam_iter) ./ lam_iter;
x=lam_iter; y=[tau_equality; lam_stab]; legend_entries={'$d=2$','$d=3$','$d=4$','$d=5$'};
legend_loc='northwest'; xLab='$\lambda$'; yLab='$\tau : E[R_\lambda^{(SQ(d))}]=E[R_{\lambda, \tau}^{(LL(d))}]$';
yLim=[0,0.5]; xLim=[0,1]; filename='../figures/fig3_5b.pdf';

[m,N]=size(y);
close all
h=figure;
marker_list=['d','x','o','+','none'];
line_list={'-','--','-.',':','--'};

if ~exist('dist_points', 'var')
    dist_points=ceil(N/20);
end
if ~exist('personal_xvals', 'var')
    personal_xvals=false;
end

for k=1:m
    if logplot
        if personal_xvals
            semilogy(x(k,:),y(k,:), 'k', 'LineWidth', 1.1,'Marker',marker_list(k),...
            'LineStyle', line_list{k},'MarkerSize',6, 'MarkerIndices',1:dist_points:N)
        else
            semilogy(x,y(k,:), 'k', 'LineWidth', 1.1,'Marker',marker_list(k),...
            'LineStyle', line_list{k},'MarkerSize',6, 'MarkerIndices',1:dist_points:N)
        end
    else
        if personal_xvals
            plot(x(k,:),y(k,:), 'k', 'LineWidth', 1.1,'Marker',marker_list(k),...
            'LineStyle', line_list{k},'MarkerSize',6, 'MarkerIndices',1:dist_points:N)
        else
            plot(x,y(k,:), 'k', 'LineWidth', 1.1,'Marker',marker_list(k),...
            'LineStyle', line_list{k},'MarkerSize',6, 'MarkerIndices',1:dist_points:N)
        end
    end
    hold on
end

text(0.8, 0.4, '$\rho > 1$', 'Interpreter', 'latex')

legend(legend_entries,'Interpreter','latex','Location',legend_loc)
xlabel(xLab,'Interpreter','latex')
ylabel(yLab,'Interpreter','latex')
xlim(xLim)
ylim(yLim)
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char(filename),'-dpdf','-r0')
