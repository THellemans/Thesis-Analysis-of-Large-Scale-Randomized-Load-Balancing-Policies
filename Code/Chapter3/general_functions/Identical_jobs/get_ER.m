function [ Fbar, FRbar, ER, w_range ] = get_ER(lam, d, tol,  lb, ub, dist_type, SCV, w_range)
%

if ~exist('SCV','var')
    SCV=9;
end

if (dist_type == "Exponential")
	alpha=1;
	A=-1;
    if ~exist('w_range', 'var')
        w_range=linspace(0,100,10^5);
    end
	g=exp(-w_range);
	Gbar=exp(-w_range);
	[ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
elseif (dist_type == "Deterministic")
	if ~exist('w_range', 'var')
        w_range=linspace(0,100,2*10^4);
    end
    [ Fbar ] = find_Fbar_deterministic(lam, d, w_range, tol, lb, ub);
elseif (dist_type == "Bounded Pareto")
	if ~exist('w_range', 'var')
        w_range=linspace(0,300,2*10^4);
    end
	g=pareto_pdf(w_range, 0.2, 72, 1.1);
	Gbar=1-pareto_cdf(w_range, 0.2, 72, 1.1);
    [ Fbar ] = find_Fbar_identical(lam, d, w_range, Gbar, g, tol, lb, ub);
elseif (dist_type == "Hyperexponential")
    if ~exist('w_range', 'var')
        w_range=linspace(0,500,5*10^4);
    end
	[ alpha, A ] = hyperexponential_init_alphaA( 1, SCV, 1/2 );
	[ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
	[ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
elseif (dist_type == "Erlang")
    if ~exist('w_range', 'var')
        w_range=linspace(0,100,2*10^4);
    end
    k=1/SCV;
    lam_erlang=k;
    [ alpha, A ] = erlang_init_alphaA(k, lam_erlang);
    [ g, Gbar ] = erlang_dist(k, lam_erlang, w_range);
    [ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
end

dw=w_range(2)-w_range(1);
if dist_type ~= "Deterministic"
    FRbar=Gbar+convolution(g,Fbar.^d,w_range(2)-w_range(1));
else
    FRbar=zeros(size(w_range));
    FRbar(w_range <= 1) = 1;
    FRbar(w_range > 1) = Fbar(1:sum(w_range > 1)).^d;
end
ER=trapz(FRbar)*dw;

end