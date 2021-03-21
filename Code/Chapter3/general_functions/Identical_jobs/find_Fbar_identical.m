function [ Fbar ] = find_Fbar_identical(lam, d, w_range, Gbar, g, tol, lb, ub)
%

Fbar0min=lb;
Fbar0max=ub;
while true
    Fbar0=(Fbar0min+Fbar0max)/2;
    Fbar = fixed_point_identical(lam, d, w_range, Gbar, g, Fbar0);
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