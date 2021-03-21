clear variables
addpath('../../Chapter 1')

%% Fig4_9b
close all

N=8*10^6;
load('../data/fig4_9b1.mat');
x=zeros(3,N);
y=zeros(3,N);

for i=1:3
    load('../data/fig4_9b' + string(i) + '.mat')
    x(i,:)=mean(times(1:N, :), 2);
    y(i,:)=mean(wloads_holder(1:N, :), 2);
end
xLim=[0, 2*10^4];
yLim=[0,60];
filename='../figures/fig4_9b.pdf';
make_and_save_fig(x, y, {"Exponential", "Deterministic", "Bounded Pareto"}, "northwest", "Time", "Mean Load", xLim, yLim, filename, false, ceil(N/20), true);

%% Fig4_9a

close all

N=8*10^6;
load('../data/fig4_9a1.mat');
x=zeros(3,N);
y=zeros(3,N);

for i=1:3
    load('../data/fig4_9a' + string(i) + '.mat')
    x(i,:)=mean(times(1:N, :), 2);
    y(i,:)=mean(wloads_holder(1:N, :), 2);
end
xLim=[0, 2*10^4];
yLim=[0,30];
filename='../figures/fig4_9a.pdf';
make_and_save_fig(x, y, {"Exponential", "Deterministic", "Hyperexponential"}, "northwest", "Time", "Mean Load", xLim, yLim, filename, false, ceil(N/20), true);
