 clear variables

addpath('../general_functions/identical_jobs')

%% Data for Fig 4.13a

tol=10^(-10);
d=2;
SCV_iter=1./(1:30);
lam_iter=0.4:0.1:0.8;
job_distribution="Erlang";
ER=zeros(length(lam_iter), length(SCV_iter));

for i =1:length(lam_iter)
    lam=lam_iter(i);
    disp("lambda="+string(lam))
    lb=0;
    ub=1;
    for j=1:length(SCV_iter)
        SCV=SCV_iter(j);
        [ Fbar, ~, ER(i, j) ] = get_ER(lam, d, tol,  lb, ub, job_distribution, SCV);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_13a.mat", "ER", "job_distribution", "SCV_iter", "lam_iter", "d")


%% Data for Fig 4.13a
clear variables

tol=10^(-10);
d=2;
SCV_iter=1:40;
lam_iter=0.4:0.1:0.8;
job_distribution="Hyperexponential";
ER=zeros(length(lam_iter), length(SCV_iter));

for i=1:length(lam_iter)
    lam=lam_iter(i);
    disp("lam="+string(lam))
    lb=0;
    ub=1;
    for j=1:length(SCV_iter)
        SCV=SCV_iter(j);
        [ Fbar, ~, ER(i, j) ] = get_ER(lam, d, tol,  lb, ub, job_distribution, SCV);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_13b.mat", "ER", "job_distribution", "SCV_iter", "lam_iter", "d")