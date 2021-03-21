function [ lam_max ] = standard_find_lam_max( d, tol,  lb, ub, Fbar0, dist_type, SCV)
%

if ~exist('SCV','var')
    SCV=9;
end

if (dist_type == "Exponential")
	alpha=1;
	A=-1;
	w_range=linspace(0,100,10^5);
	g=exp(-w_range);
	Gbar=exp(-w_range);
elseif (dist_type == "Deterministic")
	w_range=linspace(0,100,10^5);
elseif (dist_type == "Bounded Pareto")
	w_range=linspace(0,200,4*10^4);
	g=pareto_pdf(w_range, 0.2, 72, 1.1);
	Gbar=1-pareto_cdf(w_range, 0.2, 72, 1.1);
elseif (dist_type == "Hyperexponential")
	w_range=linspace(0,200,10^5);
	[ alpha, A ] = hyperexponential_init_alphaA( 1, SCV, 1/2 );
	[ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
elseif (dist_type == "Erlang")
    w_range=linspace(0,100,10^5);
    k=1/SCV;
    lam_erlang=SCV;
    [ alpha, A ] = erlang_init_alphaA(k, lam_erlang);
    [ g, Gbar ] = erlang_dist(k, lam_erlang, w_range);
end

if (dist_type == "Deterministic")
	[ lam_max ] = find_lam_max_det( d, w_range, tol,  lb, ub, Fbar0);
elseif (dist_type == "Bounded Pareto")
	[ lam_max ] = find_lam_max( d, w_range, Gbar, g, tol,  lb, ub, Fbar0);
else
	[ lam_max ] = find_lam_max_PHD( d, w_range, alpha, A, tol,  lb, ub, Fbar0);
end

end