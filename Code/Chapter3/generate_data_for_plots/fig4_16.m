add_all_paths
clear variables

%% Figure 4.16a

job_distribution="Exponential";
d_iter=1:6;
lam=0.48;
tol=10^(-5);
N=10^5;
w_range=linspace(0,500,N);
FRbar_holder=zeros(length(d_iter), N);
for i=1:length(d_iter)
    d=d_iter(i);
    if d > 1
        [ ~, FRbar_holder(i,:), ~ ] = get_ER(lam, d, tol,  0, 1, job_distribution, 1, w_range);
    else
        [ FRbar_holder(i,:) ] = get_response_times(lam, exp(-w_range), exp(-w_range), w_range, tol);
    end
end

save("../data/fig4_16a.mat", "job_distribution", "FRbar_holder", "d_iter", "w_range")


%% Figure 4.16b

job_distribution="Bounded Pareto";
d_iter=1:6;
lam=0.5;
tol=10^(-8);
N=2*10^4;
w_range=linspace(0,140,N);
FRbar_holder=zeros(length(d_iter), N);
for i=1:length(d_iter)
    d=d_iter(i);
    if d > 1
        [ ~, FRbar_holder(i,:), ~ ] = get_ER(lam, d, tol,  0, 1, job_distribution, 9, w_range);
    else
        g=pareto_pdf(w_range, 0.2, 72, 1.1);
        Gbar=1-pareto_cdf(w_range, 0.2, 72, 1.1);
        [ FRbar_holder(i,:) ] = get_response_times(lam, g, Gbar, w_range, tol);
    end
end

save("../data/fig4_16b.mat", "job_distribution", "FRbar_holder", "d_iter", "w_range")