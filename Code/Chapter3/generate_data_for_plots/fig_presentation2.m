add_all_paths

clear variables

%% Generate the data for the presentation

w_range=linspace(0, 70, 2*10^4);
d=2;
Fbar0 = 1 - 10^(-6);
N=34;
Fbar_collector=cell(2, N);

job_distributions=["Exponential"];

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
    lb=0;
    ub=1;
    for n =1:N
        lam=(lb+ub)/2;
        if job_distribution == "Exponential"
            [ Fbar_collector{i, n} ] = fixed_point_identical_PHD(lam, d, w_range, alpha, A, Fbar0);
        else
            [ Fbar_collector{i, n} ] = fixed_point_identical(lam, d, w_range, Gbar, g, Fbar0);
        end
        if Fbar_collector{i, n}(end)> 0
            lb=lam;
        else
            ub=lam;
        end
        Fbar_collector{i, n}(Fbar_collector{i, n}<0)=10^(-16);
    end
end

save('../data/fig_presentation2.mat', 'Fbar_collector', 'w_range', 'N')