clear all
close all

load('../data/fig_presentation2.mat')
%% Figure presentation 1
h=figure
for n=1:N
    semilogy(w_range, Fbar_collector{1,n}, 'color', 'k', 'LineWidth', n/40);
    hold on
    ylim([10^(-10), 1])
    xlim([0,70])

    xlabel("$w$", 'Interpreter', 'latex')
    ylabel("$\bar F_n(w)$", 'Interpreter', 'latex')

    set(gca,'fontsize',14)
    box on
    set(h,'Units','Inches');
    pos = get(h,'Position');
    set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
    print(h,"../figures/plot_stability_" + n + ".pdf",'-dpdf','-r0')
end