clear variables

addpath('../../Chapter 1')
addpath('../general_functions/Independent_jobs')

%% Data for Fig 4.19a + 4.20a

tol=10^(-10);
d=2;
N=500;
lam_iter=linspace(0.001,1.6,N);
job_distributions={"Exponential", "Bounded Pareto", "Hyperexponential"};
Fbar0_holder=1000*ones(length(job_distributions), length(lam_iter));
ER=1000*ones(length(job_distributions), length(lam_iter));

for i =1:length(job_distributions)
    job_distribution=job_distributions{i};
    disp(job_distribution)
    lb=0;
    ub=1;
    for j=1:length(lam_iter)
        lam=lam_iter(j);
        [ Fbar, ~, ER(i,j) ] = get_independent_ER(lam, d, tol,  lb, ub, job_distribution);
        Fbar0_holder(i,j)=Fbar(1);
        lb=Fbar(1);
        ub=min(Fbar(1)+5/N,1);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_19a.mat", "Fbar0_holder", "job_distributions", "lam_iter", "d")
save("../data/fig4_20a.mat", "ER", "job_distributions", "lam_iter", "d")

%% Data for Fig 4.19b
clear variables

tol=10^(-10);
d_iter=2:5;
N=500;
lam_iter=linspace(0.001,1.5,N);
job_distribution="Bounded Pareto";
Fbar0_holder=1000*ones(length(d_iter), length(lam_iter));
ER=1000*ones(length(d_iter), length(lam_iter));

for i =1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    lb=0;
    ub=1;
    a=1;
    for j=1:length(lam_iter)
        lam=lam_iter(j);
        [ Fbar, ~, ER(i,j) ] = get_independent_ER(lam, d, tol,  lb, ub, job_distribution);
        Fbar0_holder(i,j)=Fbar(1);
        lb=Fbar(1);
        ub=min(Fbar(1)+5/N,1);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_19b.mat", "Fbar0_holder", "job_distribution", "lam_iter", "d_iter")
save("../data/fig4_20b.mat", "ER", "job_distribution", "lam_iter", "d_iter")