clear variables

addpath('../general_functions/identical_jobs')

%% Data for Fig 4.21a

tol=10^(-10);
d_iter=2:5;
SCV_iter=1./(1:30);
lam=0.45;
job_distribution="Erlang";
ER=zeros(length(d_iter), length(SCV_iter));

for i =1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    lb=0;
    ub=1;
    for j=1:length(SCV_iter)
        SCV=SCV_iter(j);
        [ Fbar, ~, ER(i, j) ] = get_independent_ER(lam, d, tol,  lb, ub, job_distribution, SCV);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_21a.mat", "ER", "job_distribution", "SCV_iter", "d_iter", "lam")


%% Data for Fig 4.21b
clear variables

tol=10^(-10);
d_iter=2:5;
SCV_iter=1:40;
lam=0.45;
job_distribution="Hyperexponential";
ER=zeros(length(d_iter), length(SCV_iter));

for i=1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    lb=0;
    ub=1;
    for j=1:length(SCV_iter)
        SCV=SCV_iter(j);
        [ Fbar, ~, ER(i, j) ] = get_independent_ER(lam, d, tol,  lb, ub, job_distribution, SCV);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_21b.mat", "ER", "job_distribution", "SCV_iter", "d_iter", "lam")