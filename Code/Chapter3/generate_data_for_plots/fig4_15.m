 clear variables

addpath('../general_functions/identical_jobs')

%% Data for Fig 4.15a

tol=10^(-10);
d_iter=2:5;
N=500;
lam_iter=linspace(0.001,0.82,N);
job_distribution="Deterministic";
varR=1000*ones(length(d_iter), length(lam_iter));

for i =1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    lb=0;
    ub=1;
    for j=1:length(lam_iter)
        lam=lam_iter(j);
        [ Fbar, varR(i,j) ] = get_varR(lam, d, tol,  lb, ub, job_distribution);
        lb=Fbar(1);
        ub=min(Fbar(1)+5/N,1);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_15a.mat", "varR", "job_distribution", "lam_iter", "d_iter")


%% Data for Fig 4.15a
clear variables

tol=10^(-10);
d_iter=2:5;
N=500;
lam_iter=linspace(0.001,0.82,N);
job_distribution="Exponential";
varR=1000*ones(length(d_iter), length(lam_iter));

for i =1:length(d_iter)
    d=d_iter(i);
    disp("d="+string(d))
    lb=0;
    ub=1;
    for j=1:length(lam_iter)
        lam=lam_iter(j);
        [ Fbar, temp ] = get_varR(lam, d, tol,  lb, ub, job_distribution);
        if temp < 0
            break
        end
        varR(i,j)=temp;
        lb=Fbar(1);
        ub=min(Fbar(1)+5/N,1);
        if (lb > 1-10^(-4))
            break
        end
    end
end

save("../data/fig4_15b.mat", "varR", "job_distribution", "lam_iter", "d_iter")