function [h] = make_and_save_fig(x, y, legend_entries, legend_loc, xLab, yLab, xLim, yLim, logplot)
%

[m,N]=size(y);
close all
h=figure;
marker_list=['d','x','o','+','s','*'];
line_list={'-','--','-.',':','-','--'};
for k=1:m
    if logplot
        semilogy(x,y(k,:), 'k', 'LineWidth', 1.1,...
        'Marker',marker_list(k),'LineStyle', line_list{k},'MarkerSize',6, 'MarkerIndices',1:floor(N/20):N)
    else
        plot(x,y(k,:), 'k', 'LineWidth', 1.1,...
        'Marker',marker_list(k),'LineStyle', line_list{k},'MarkerSize',6, 'MarkerIndices',1:floor(N/20):N)
    end
    hold on
end

legend(legend_entries,'Interpreter','latex','Location',legend_loc)
xlabel(xLab,'Interpreter','latex')
ylabel(yLab,'Interpreter','latex')
xlim(xLim)
ylim(yLim)

end