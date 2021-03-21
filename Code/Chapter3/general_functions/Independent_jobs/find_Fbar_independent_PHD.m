function [ Fbar ] = find_Fbar_independent_PHD(lam, d, s_range, Gbar, alpha, A, tol,  lb, ub)
%

Fbar0min=lb;
Fbar0max=ub;
while true
    Fbar0=(Fbar0min+Fbar0max)/2;
    [ Fbar ] = fixed_point_independent_PHD(lam, d, s_range, Gbar, alpha, A, Fbar0);
    if (Fbar(end) > 0)
        Fbar0max=Fbar0;
    else
        Fbar0min=Fbar0;
    end
    if (Fbar0max-Fbar0min ) < tol
    	return
    end
end
end