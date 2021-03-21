function [ Fbar ] = find_Fbar_deterministic(lam, d, s_range, tol, lb, ub)
%

Fbar0min=lb;
Fbar0max=ub;
while (Fbar0max-Fbar0min > tol)
    Fbar0=(Fbar0min+Fbar0max)/2;
    Fbar = fixed_point_deterministic(lam, d, s_range, Fbar0);
    if (Fbar(end) > 0)
        Fbar0max=Fbar0;
    else
        Fbar0min=Fbar0;
    end
end
end