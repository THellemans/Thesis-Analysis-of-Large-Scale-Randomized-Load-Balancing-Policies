 clear variables

addpath('../general_functions/independent_jobs')
addpath('../general_functions/independent_jobs/stability')

%% Data for Fig 4.25

tol=10^(-10); Fbar0=1-10^(-4);
d_iter=1:50;
job_distributions={"Deterministic", "Exponential", "Bounded Pareto", "Hyperexponential"};
lam_max=zeros(length(job_distributions), length(d_iter));
EminGtimesd_BoundedPareto=zeros(1, length(d_iter));

for i =1:length(job_distributions)
    job_distribution=job_distributions{i};
    disp(job_distribution)
    if job_distribution == "Hyperexponential"
        lb=0;
        ub=2;
    else
        lb=0;
        ub=1.5;
    end
    for j=1:length(d_iter)
        d=d_iter(j);
        if d == 1
            lam_max(i,j)=1;
            continue 
        end
        [ lam_max(i,j) ] = standard_find_lam_max_independent( d, tol,  lb, ub, Fbar0, job_distribution);
    end
end

w_range=linspace(0,300,10^5);
for i = 1:length(d_iter)
    d=d_iter(i);
    Gbar=1-pareto_cdf(w_range, 0.2, 72, 1.1);
    !! Hier moet ik nog een minimum nemen !!
    EminGtimesd_BoundedPareto(i)=trapz(Gbar)*(w_range(2)-w_range(1)) * d;
end

save("../data/fig4_25.mat", "job_distributions", "lam_max", "d_iter", "EminGtimesd_BoundedPareto")
