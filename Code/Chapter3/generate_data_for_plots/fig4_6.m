add_all_paths

clear variables

%% Generate the data for Figure 4.6a

w_range=linspace(0, 200, 2*10^4);
lam=0.7;
d=2;
N=34;
Fbar_collector=cell(2, N);

job_distributions=["Bounded Pareto", "Exponential"];
for i =1:length(job_distributions)
    job_distribution=job_distributions(i);
    if job_distribution == "Exponential"
        alpha=1;
        A=-1;
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
        if job_distribution == "Exponential"
            [ Fbar_collector{i, n} ] = fixed_point_identical_PHD(lam, d, w_range, alpha, A, Fbar0);
        else
            [ Fbar_collector{i, n} ] = fixed_point_identical(lam, d, w_range, Gbar, g, Fbar0);
        end
        if Fbar_collector{i, n}(end)> 0
            ub=Fbar0;
        else
            lb=Fbar0;
        end
        Fbar_collector{i, n}(Fbar_collector{i, n}<0)=10^(-16);
    end
end

save('../data/fig4_6.mat', 'Fbar_collector', 'w_range', 'N')