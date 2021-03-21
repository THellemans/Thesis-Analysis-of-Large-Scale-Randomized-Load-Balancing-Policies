function [ Fbar ] = find_Fbar_identical_delay_PHD(lam, delta, d, w_range, Gbar, alpha, A, tol,  lb, ub)
%

Fbar0min=lb;
Fbar0max=ub;
while true
    Fbar0=(Fbar0min+Fbar0max)/2;
    [ Fbar ] = fixed_point_identical_delay_PHD(lam, delta, d, w_range, Gbar, alpha, A, Fbar0);
    if (Fbar(end) > 0)
        Fbar0max=Fbar0;
    else
        Fbar0min=Fbar0;
    end
    if (Fbar0max-Fbar0min < tol)
        break;
    end
end

end