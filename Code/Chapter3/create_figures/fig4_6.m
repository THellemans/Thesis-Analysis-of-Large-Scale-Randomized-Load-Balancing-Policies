clear all
close all

load('../data/fig4_6.mat')
%% Figure 4.6a
h=figure
for n=1:N
    semilogy(w_range, Fbar_collector{1,n}, 'color', 'k', 'LineWidth', n/40);
    hold on
end
ylim([10^(-10), 1])
xlim([0,200])

xlabel("$w$", 'Interpreter', 'latex')
ylabel("$\bar F_n(w)$", 'Interpreter', 'latex')

set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,"../figures/fig4_6a.pdf",'-dpdf','-r0')

%% Figure 4.6b
close all
h=figure
for n=1:N
    semilogy(w_range, Fbar_collector{2,n}, 'color', 'k', 'LineWidth', n/40);
    hold on
end
ylim([10^(-10), 1])
xlim([0,60])

xlabel("$w$", 'Interpreter', 'latex')
ylabel("$\bar F_n(w)$", 'Interpreter', 'latex')

set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,"../figures/fig4_6b.pdf",'-dpdf','-r0')