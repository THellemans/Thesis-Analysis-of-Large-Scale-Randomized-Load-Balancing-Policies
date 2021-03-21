clear all
addpath('../')
addpath('../../Chapter 1')
addpath('../general_functions')

%% Fig3_6a

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig3_6a'  + string(i) + '.mat')
    errorbar(svals,mean(sresps),conf_resps,'ko','MarkerSize',2)
    hold on
    plot(w_range, FRbar, 'color', 'k', 'LineWidth', 1.2)
end
xlim([0,10])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}_R(w)$','Interpreter','latex')

text(5.5, 0.1, '$d=2, \lambda=0.95$', 'Interpreter', 'latex')
p1 = [0.4 0.5];                         
p2 = [0.525 0.625];                         
annotation('textarrow',p1,p2,'String','$d=3, \lambda=0.9$', 'Interpreter', 'latex');
%text(p1(1),p1(2), '$d=3, \lambda=0.9$', 'Interpreter', 'latex')
text(5, 10^(-3), '$d=4, \lambda=0.8$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig3_6a.pdf'),'-dpdf','-r0')

%% Fig3_6b

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig3_6b'  + string(i) + '.mat')
    errorbar(svals,mean(sresps),conf_resps,'ko','MarkerSize',2)
    hold on
    if i==3
        plot(w_range, FRbar, 'color', 'k', 'LineWidth', 1.2)
    end
end
xlim([0,10])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}_R(w)$','Interpreter','latex')

text(7, 0.08, '$N=20$', 'Interpreter', 'latex')
text(8.8,0.0025, '$N=100$', 'Interpreter', 'latex')
text(6.7, 2*10^(-3), '$N=500$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig3_6b.pdf'),'-dpdf','-r0')

%% Fig3_6c

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig3_6c'  + string(i) + '.mat')
    errorbar(svals,mean(sresps),conf_resps,'ko','MarkerSize',2)
    hold on
    plot(w_range, FRbar, 'color', 'k', 'LineWidth', 1.2)
end
xlim([0,100])
ylim([10^(-5),1])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}_R(w)$','Interpreter','latex')

text(50, 4*10^(-2), '$d=2, \lambda=0.95, SCV=20$', 'Interpreter', 'latex')
text(63,3*10^(-4), '$d=3, \lambda=0.8,$', 'Interpreter', 'latex')
text(70, 1.5*10^(-4), '$SCV=10$', 'Interpreter', 'latex')
text(10, 0.9*10^(-4), '$d=4, \lambda=0.8,$', 'Interpreter', 'latex')
text(15, 0.4*10^(-4), '$SCV=5$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig3_6c.pdf'),'-dpdf','-r0')

%% Fig3_6d

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig3_6d'  + string(i) + '.mat')
    errorbar(svals,mean(sresps),conf_resps,'ko','MarkerSize',2)
    hold on
    if i==3
        plot(w_range, FRbar, 'color', 'k', 'LineWidth', 1.2)
    end
end
xlim([0,100])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}_R(w)$','Interpreter','latex')

text(70, 0.015, '$N=20$', 'Interpreter', 'latex')
text(65,0.005, '$N=100$', 'Interpreter', 'latex')
text(30, 10^(-2), '$N=500$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig3_6d.pdf'),'-dpdf','-r0')
