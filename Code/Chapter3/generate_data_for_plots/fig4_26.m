%% Figure 4.26a

job_distribution="Exponential";
d_iter=1:6;
lam=0.48;
tol=10^(-10);
N=10^5;
w_range=linspace(0,100,N);
FRbar_holder=zeros(length(d_iter), N);
for i=1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    if d > 1
        [ ~, FRbar_holder(i,:), ~ ] = get_independent_ER(lam, d, tol,  0, 1, job_distribution);
    else
        [ FRbar_holder(i,:) ] = MG1_response(lam, exp(-w_range), exp(-w_range), w_range, tol);
    end
end

save("../data/fig4_26a.mat", "job_distribution", "FRbar_holder", "d_iter", "w_range")

%% Figure 4.26b

job_distribution="Bounded Pareto";
d_iter=1:6;
lam=0.48;
tol=10^(-10);
N=2*10^4;
w_range=linspace(0,140,N);
FRbar_holder=zeros(length(d_iter), N);
for i=1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    if d > 1
        [ ~, FRbar_holder(i,:), ~ ] = get_independent_ER(lam, d, tol,  0, 1, job_distribution);
    else
        g=pareto_pdf(w_range, 0.2, 72, 1.1);
        Gbar=1-pareto_cdf(w_range, 0.2, 72, 1.1);
        [ FRbar_holder(i,:) ] = MG1_response(lam, g, Gbar, w_range, tol);
    end
end

save("../data/fig4_26b.mat", "job_distribution", "FRbar_holder", "d_iter", "w_range")