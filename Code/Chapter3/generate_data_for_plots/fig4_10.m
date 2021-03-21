clear variables

addpath('../../Chapter 1')
addpath('../general_functions/Identical_jobs')

%% Figure 4.10a

N=200; d=2;
lam_iter=linspace(0.5,0.9,N);
Fbar0_holder=2*ones(4,N);

% Exponential Job Sizes
w_range=linspace(0,100,10^5);
alpha=1; A=-1; tol=10^(-10);
lb=0; ub=1;

disp("Exp(1) jobs")
for lam_i=1:length(lam_iter)
    lam=lam_iter(lam_i);
    [ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
    Fbar0_holder(1, lam_i)=Fbar(1);
    lb=Fbar(1); ub=min(Fbar(1)+5/N, 1);
    if lb > 1-10^(-4)
        break;
    end
end

% Deterministic Job Sizes
w_range=linspace(0,100,10^5);
lb=0; ub=1;

disp("Deterministic jobs")
for lam_i=1:length(lam_iter)
    lam=lam_iter(lam_i);
    [ Fbar ] = find_Fbar_deterministic(lam, d, w_range, tol, lb, ub);
    Fbar0_holder(2, lam_i)=Fbar(1);
    lb=Fbar(1); ub=min(Fbar(1)+5/N, 1);
    if lb > 1-10^(-4)
        break;
    end
end

% Bounded Pareto Job Sizes
w_range=linspace(0,200,2*10^4);
tol=10^(-10); sp1=0.2; sp2=72; sp3=1.1;
Gbar=1-pareto_cdf(w_range, sp1, sp2, sp3);
g=pareto_pdf(w_range, sp1, sp2, sp3);
lb=0; ub=1;

disp("Bounded Pareto jobs")
for lam_i=1:length(lam_iter)
    lam=lam_iter(lam_i);
    [ Fbar ] = find_Fbar_identical(lam, d, w_range, Gbar, g, tol, lb, ub);
    Fbar0_holder(3, lam_i)=Fbar(1);
    lb=Fbar(1); ub=min(Fbar(1)+5/N, 1);
    if lb > 1-10^(-4)
        break;
    end
end

% Hyper Exponential Job Sizes
w_range=linspace(0,200,10^5);
[ alpha, A ] = hyperexponential_init_alphaA( 1, 9, 1/2 );
tol=10^(-10);
lb=0; ub=1;

disp("Hyper Exponential jobs")
for lam_i=1:length(lam_iter)
    lam=lam_iter(lam_i);
    [ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
    Fbar0_holder(4, lam_i)=Fbar(1);
    lb=Fbar(1); ub=min(Fbar(1)+5/N, 1);
    if lb > 1-10^(-4)
        break;
    end
end

save("../data/fig4_10a.mat", "Fbar0_holder", "lam_iter")

%% Figure 4.10b
d_iter=2:5; lam_iter=linspace(0,1,N);
w_range=linspace(0,200,2*10^4);
tol=10^(-10); sp1=0.2; sp2=72; sp3=1.1;
Gbar=1-pareto_cdf(w_range, sp1, sp2, sp3);
g=pareto_pdf(w_range, sp1, sp2, sp3);
Fbar0_holder=2*ones(4,N);

for d_i=1:length(d_iter)
    d=d_iter(d_i);
    disp("d="+string(d))
    lb=0; ub=1;
    for lam_i=1:length(lam_iter)
        lam=lam_iter(lam_i);
        [ Fbar ] = find_Fbar_identical(lam, d, w_range, Gbar, g, tol, lb, ub);
        Fbar0_holder(d_i, lam_i)=Fbar(1);
        lb=Fbar(1); ub=min(Fbar(1)+5/N, 1);
        if lb > 1-10^(-3)
            break;
        end
    end
end
save("../data/fig4_10b.mat", "Fbar0_holder", "lam_iter")