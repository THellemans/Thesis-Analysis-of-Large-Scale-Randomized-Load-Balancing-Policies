function [ Fbar ] = find_Fbar_independent(lam, d, s_range, Gbar, g, tol, lb, ub)
%

if ~exist('lb', 'var')
    lb=0;
end
if ~exist('ub', 'var')
    ub=1;
end
if ~exist('tol', 'var')
    tol=10^(-4);
end

Fbar0min=lb;
Fbar0max=ub;
while true
    Fbar0=(Fbar0min+Fbar0max)/2;
    [ Fbar ] = fixed_point_IDE_independent(lam, d, s_range, Gbar, g, Fbar0);
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