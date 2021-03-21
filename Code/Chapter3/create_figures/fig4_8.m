clear variables
addpath('../../Chapter 1')

%% Fig4_8a

close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig4_8a'  + string(i) + '.mat')
    errorbar(svals,mean(sloads),conf_loads,'ko','MarkerSize',2)
    hold on
end

load('../data/fig4_8a0.mat')
plot(w_range, Fbar, 'color', 'k', 'LineWidth', 1.2)

xlim([0,10])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}(w)$','Interpreter','latex')

text(5.5, 0.15, '$N=10$', 'Interpreter', 'latex')
p1 = [0.4 0.49];                         
p2 = [0.6 0.69];                         
annotation('textarrow',p1,p2,'String','$N=50$', 'Interpreter', 'latex');
%text(p1(1),p1(2), '$d=3, \lambda=0.9$', 'Interpreter', 'latex')
text(5, 2.5*10^(-2), '$N=250$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig4_8a.pdf'),'-dpdf','-r0')

%% Fig4_8b
close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig4_8b'  + string(i) + '.mat')
    errorbar(svals,mean(sloads),conf_loads,'ko','MarkerSize',2)
    hold on
end

load('../data/fig4_8b0.mat')
plot(w_range, Fbar, 'color', 'k', 'LineWidth', 1.2)

xlim([0,4])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}(w)$','Interpreter','latex')

text(3, 0.025, '$N=10$', 'Interpreter', 'latex')
p1 = [0.64 0.585];                         
p2 = [0.84 0.785];                         
annotation('textarrow',p1,p2,'String','$N=50$', 'Interpreter', 'latex');
%text(p1(1),p1(2), '$d=3, \lambda=0.9$', 'Interpreter', 'latex')
text(2.4, 10^(-3), '$N=250$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig4_8b.pdf'),'-dpdf','-r0')

%% Fig4_8c
close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig4_8c'  + string(i) + '.mat')
    errorbar(svals,mean(sloads),conf_loads,'ko','MarkerSize',2)
    hold on
end

load('../data/fig4_8c0.mat')
plot(w_range, Fbar, 'color', 'k', 'LineWidth', 1.2)
plot([72 72], [10^(-5) Fbar(find(w_range<72, 1, 'last' ))], 'color', 'k', 'LineWidth', 0.9, 'LineStyle', '--')

xtick_vals=[0 20 40 60 72 80 100];
xticks(xtick_vals)

xlim([0,100])
ylim([10^(-5), 10^0])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}(w)$','Interpreter','latex')

text(48, 3.5*10^(-2), '$N=10$', 'Interpreter', 'latex')
p1 = [0.8 0.79];
p2 = [0.52 0.36];
annotation('textarrow',p1,p2,'String','$N=50$', 'Interpreter', 'latex');
%text(p1(1),p1(2), '$d=3, \lambda=0.9$', 'Interpreter', 'latex')
text(69, 10^(-4), '$N=250$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig4_8c.pdf'),'-dpdf','-r0')


%% Fig4_8d
close all
h=figure;
hAx=axes;
for i = 1:3
    load('../data/fig4_8d'  + string(i) + '.mat')
    errorbar(svals,mean(sloads),conf_loads,'ko','MarkerSize',2)
    hold on
end

load('../data/fig4_8d0.mat')
plot(w_range, Fbar, 'color', 'k', 'LineWidth', 1.2)

xlim([0,100])
ylim([10^(-5), 10^0])
hAx.YScale='log';
xlabel('$w$','Interpreter','latex')
ylabel('$\bar{F}(w)$','Interpreter','latex')

text(49, 3.6*10^(-2), '$N=10$', 'Interpreter', 'latex')
p1 = [0.8 0.71];
p2 = [0.52 0.48];
annotation('textarrow',p1,p2,'String','$N=50$', 'Interpreter', 'latex');
%text(p1(1),p1(2), '$d=3, \lambda=0.9$', 'Interpreter', 'latex')
text(69, 0.4*10^(-3), '$N=250$', 'Interpreter', 'latex')
set(gca,'fontsize',14)
box on
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,char('../figures/fig4_8d.pdf'),'-dpdf','-r0')