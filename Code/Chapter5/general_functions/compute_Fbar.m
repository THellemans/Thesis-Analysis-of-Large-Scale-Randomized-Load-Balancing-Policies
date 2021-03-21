function [Fbar] = compute_Fbar(T, rho, w_range)
%

Fbar=zeros(size(w_range));
Fbar(1) = rho;
dw = w_range(2) - w_range(1);
for i=1:(length(w_range)-1)
    Fbar(i+1) = Fbar(i) + dw * (T(Fbar(i)) - Fbar(i));
    if Fbar(i+1) < 10^(-8)
        break
    end
end

end

