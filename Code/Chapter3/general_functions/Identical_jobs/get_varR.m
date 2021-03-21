function [ Fbar, VarRT ] = get_varR(lam, d, tol,  lb, ub, dist_type, SCV)
%

if ~exist('SCV','var')
    SCV=9;
end

if (dist_type == "Exponential")
	alpha=1;
	A=-1;
	w_range=linspace(0,300,10^5);
	g=exp(-w_range);
	Gbar=exp(-w_range);
	[ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
elseif (dist_type == "Deterministic")
	w_range=linspace(0,300,10^5);
    [ Fbar ] = find_Fbar_deterministic(lam, d, w_range, tol, lb, ub);
elseif (dist_type == "Bounded Pareto")
	w_range=linspace(0,500,4*10^4);
	g=pareto_pdf(w_range, 0.2, 72, 1.1);
	Gbar=1-pareto_cdf(w_range, 0.2, 72, 1.1);
    [ Fbar ] = find_Fbar_identical(lam, d, w_range, Gbar, g, tol, lb, ub);
elseif (dist_type == "Hyperexponential")
	w_range=linspace(0,500,10^5);
	[ alpha, A ] = hyperexponential_init_alphaA( 1, SCV, 1/2 );
	[ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
	[ Fbar ] = find_Fbar_identical_PHD(lam, d, w_range, alpha, A, tol,  lb, ub);
elseif (dist_type == "Erlang")
    w_range=linspace(0,300,10^5);
    k=1/SCV;
    lam_erlang=SCV;
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

FRsqrdbar=interp1(w_range, FRbar, sqrt(w_range));
VarRT=trapz(FRsqrdbar)*dw-(trapz(FRbar)*dw)^2;

end