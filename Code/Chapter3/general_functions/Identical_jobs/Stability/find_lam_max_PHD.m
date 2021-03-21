function [ lam_max ] = find_lam_max_PHD( d, w_range, alpha, A, tol,  lb, ub, Fbar0)
%

lam_max_lb=lb;
lam_max_ub=ub;
while (lam_max_ub-lam_max_lb > tol)
    lam=(lam_max_lb+lam_max_ub)/2;
    [ Fbar ] = fixed_point_identical_PHD(lam, d, w_range, alpha, A, Fbar0);
    if (Fbar(end) > 0)
        lam_max_lb=lam;
    else
        lam_max_ub=lam;
    end
end
lam_max=(lam_max_ub+lam_max_lb)/2;
end