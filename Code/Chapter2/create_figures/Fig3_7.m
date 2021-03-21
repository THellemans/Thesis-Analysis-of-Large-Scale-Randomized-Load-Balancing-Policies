clear all
addpath('../')
addpath('../../Chapter 1')
addpath('../general_functions')

%% Fig3_7a

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig3_7a'  + string(i) + '.mat')
    errorbar(svals,mean(sresps),conf_resps,'ko','MarkerSize',2)
    hold on
end
plot(w_range, FRbar, 'color', 'k', 'LineWidth', 1.2)
xlim([0,200])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}_R(w)$','Interpreter','latex')

text(80, 0.0007, '$N=20$', 'Interpreter', 'latex')
p1 = [0.61 0.59];                         
p2 = [0.34 0.27];                         
annotation('textarrow',p1,p2,'String','$N=100$', 'Interpreter', 'latex');
text(100, 0.00006, '$N=500$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig3_7a.pdf'),'-dpdf','-r0')

%% Fig3_7b

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig3_7b'  + string(i) + '.mat')
    errorbar(svals,mean(sresps),conf_resps,'ko','MarkerSize',2)
    hold on
end
plot(w_range, FRbar, 'color', 'k', 'LineWidth', 1.2)
xlim([0,5])
ylim([10^(-5), 1])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}_R(w)$','Interpreter','latex')

text(3.7, 0.01, '$N=20$', 'Interpreter', 'latex')
text(4, 10^(-4), '$N=100$', 'Interpreter', 'latex')
text(2.6, 10^(-3), '$N=500$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig3_7b.pdf'),'-dpdf','-r0')

