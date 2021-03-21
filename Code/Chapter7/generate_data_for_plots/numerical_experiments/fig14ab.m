addpath('../../general_functions')
%% Fig 14a & 14b
% Fig 14a : types 1 4 5 7
% Fig 14b : types 2 3 6 7
clear variables

types=1:7;
d=5; lambdas=linspace(0.3,0.995);
SCV=10; f=1/2;
threshold=2;
Bsize=20; tol=10^(-8);
good_threshold=false;
jtype=3;
q=0.9523;
k_PH=5;
EX1=0.5251;

EW=zeros(length(types), length(lambdas));

for type = types
    type
    if type == 2 || type == 6
        Delta=2; RepMax=2;
    else
        Delta=0.1; RepMax=30;
    end
    [EW(type, :)] = data_plot_EW(d,lambdas,SCV,f,type,Delta,RepMax,threshold,Bsize,tol,good_threshold, jtype, q, EX1, k_PH);
end

[EW_SQ] = data_normal_SQ(d, lambdas,SCV,f,Bsize, length(lambdas), tol, jtype, q, EX1, k_PH);

EW_rel=(EW_SQ-EW) ./ EW_SQ;

save('../../data/fig14ab.mat', 'EW', 'EW_SQ', 'EW_rel', 'lambdas')