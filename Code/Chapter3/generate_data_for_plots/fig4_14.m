 clear variables

addpath('../general_functions/identical_jobs')

%% Data for Fig 4.14

tol=10^(-10); Fbar0=1-10^(-4);
d_iter=1:50;
job_distributions={"Deterministic", "Exponential", "Bounded Pareto", "Hyperexponential"};
lam_max=zeros(length(job_distributions), length(d_iter));

for i =1:length(job_distributions)
    job_distribution=job_distributions{i};
    disp(job_distribution)
    lb=0;
    ub=1;
    for j=1:length(d_iter)
        d=d_iter(j);
        if d == 1
            lam_max(i,j)=1;
            continue
        end
        [ lam_max(i,j) ] = standard_find_lam_max( d, tol,  lb, ub, Fbar0, job_distribution);
    end
end

save("../data/fig4_14.mat", "job_distributions", "lam_max", "d_iter")