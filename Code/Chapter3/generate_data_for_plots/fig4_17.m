%% Figure 4.17a

job_distributions={"Exponential", "Deterministic", "Bounded Pareto", "Hyperexponential"};
d=2;
lam=0.5;
tol=10^(-10);
FRbar=zeros(length(job_distributions), 10^5);
w_range=linspace(0,20,10^5);
for i=1:length(job_distributions)
    job_distribution=job_distributions{i};
    [ ~, temp_FRbar, ~, temp_w_range ] = get_ER(lam, d, tol,  0, 1, job_distribution); 
    FRbar(i,:)=interp1(temp_w_range, temp_FRbar, w_range);
end

save("../data/fig4_17a.mat", "job_distributions", "FRbar", "d", "lam", "w_range")

%% Figure 4.17b

job_distributions={"Exponential", "Deterministic", "Bounded Pareto", "Hyperexponential"};
d=2;
lam=0.8;
tol=10^(-10);
w_range=linspace(0,20,10^5);
FRbar=zeros(length(job_distributions), 10^5);
for i=1:length(job_distributions)
    job_distribution=job_distributions{i};
    [ ~, temp_FRbar, ~, temp_w_range ] = get_ER(lam, d, tol,  0, 1, job_distribution);
    FRbar(i,:)=interp1(temp_w_range, temp_FRbar, w_range);
end

save("../data/fig4_17b.mat", "job_distributions", "FRbar", "d", "lam", "w_range")
