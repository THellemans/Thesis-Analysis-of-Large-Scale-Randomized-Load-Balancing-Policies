add_all_paths

%% Generate the data for Figure 4.5a

w_range=linspace(0, 100, 10^5);
lam=0.48;
d_iter=2:5;
N=100;
Fbar_collector=cell(length(d_iter), N);
alpha=1;
A=-1;

for i=1:length(d_iter)
    d=d_iter(i);
    lb=1-lam;
    ub=1;
    for n =1:N
        Fbar0=(lb+ub)/2;
        [ Fbar_collector{i, n} ] = fixed_point_identical_PHD(lam, d, w_range, alpha, A, Fbar0);
        if Fbar_collector{i, n}(end)> 0
            ub=Fbar0;
        else
            lb=Fbar0;
        end
    end
end

sup_norm_error=zeros(length(d_iter), N);
for i = 1:length(d_iter)
    for n=1:N
        sup_norm_error(i, n)=max(abs(Fbar_collector{i, n}-Fbar_collector{i, end}));
    end
end

save('../data/fig4_5a.mat', 'sup_norm_error', 'd_iter', 'lam', 'alpha', 'A')

%% Generate the data for Figure 4.5b
w_range=linspace(0, 200, 10^4);

d=2;
lam=0.8;

job_distributions=["Exponential", "Deterministic", "Bounded Pareto", "Hyperexponential"];
for i =1:length(job_distributions)
    job_distribution=job_distributions(i);
    if job_distribution == "Exponential"
        alpha=1;
        A=-1;
    elseif job_distribution == "Hyperexponential"
        [ alpha, A ] = hyperexponential_init_alphaA( 1, 10, 1/2 );
    elseif job_distribution == "Bounded Pareto"
        lb_pareto=0.2;
        ub_pareto=72;
        alpha=1.1;
        Gbar = 1 - pareto_cdf(w_range, lb_pareto, ub_pareto, alpha);
        g = pareto_pdf(w_range, lb_pareto, ub_pareto, alpha);
    end
    lb=1-lam;
    ub=1;
    for n =1:N
        Fbar0=(lb+ub)/2;
        if job_distribution == "Exponential" || job_distribution == "Hyperexponential"
            [ Fbar_collector{i, n} ] = fixed_point_identical_PHD(lam, d, w_range, alpha, A, Fbar0);
        elseif job_distribution == "Deterministic"
            [ Fbar_collector{i, n} ] = fixed_point_deterministic(lam, d, w_range, Fbar0);
        else
            [ Fbar_collector{i, n} ] = fixed_point_identical(lam, d, w_range, Gbar, g, Fbar0);
        end
        if Fbar_collector{i, n}(end)> 0
            ub=Fbar0;
        else
            lb=Fbar0;
        end
    end
end

sup_norm_error=zeros(length(d_iter), N);
for i = 1:length(d_iter)
    for n=1:N
        sup_norm_error(i, n)=max(abs(Fbar_collector{i, n}-Fbar_collector{i, end}));
    end
end

save('../data/fig4_5b.mat', 'sup_norm_error', 'job_distributions', 'lam', 'd')