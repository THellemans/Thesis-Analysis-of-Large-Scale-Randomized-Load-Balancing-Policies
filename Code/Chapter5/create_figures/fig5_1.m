addpath('../general_functions')

load('../data/fig5_1a.mat')

%% figure 5_1a
x=1:N; y=u; legend_entries={"$\lambda = 1 - 10^{-2}$", "$\lambda = 1 - 10^{-6}$", "$\lambda = 1 - 10^{-10}$", "$\lambda = 1 - 10^{-14}$"};
legend_loc='northeast';
xLab='$k$'; yLab='$u_k$'; xLim=[0, 80]; yLim=[0, 1]; filename="../figures/fig5_1a.pdf"; logplot=false;
make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, filename, logplot, 1);

%% figure 5_1b
load('../data/fig5_1b.mat')
x=1:N; y=ultide_quot; legend_entries={"$d=2$", "$d=3$", "$d=4$", "$d=4$"};
legend_loc='southwest';
xLab='$k$'; yLab='$\frac{\tilde u_{k+1}}{\tilde u_{k}}$'; xLim=[0, 50]; yLim=[0, 5.5]; filename="../figures/fig5_1b.pdf"; logplot=false;

[m,N]=size(y);
close all
h=figure;
marker_list=['d','x','o','+','s','*'];
line_list={'-','--','-.',':','-','--'};

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

for k = 2:5
    plot(x,k*ones(size(x)), 'k', 'LineWidth', 1.1)
end
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
