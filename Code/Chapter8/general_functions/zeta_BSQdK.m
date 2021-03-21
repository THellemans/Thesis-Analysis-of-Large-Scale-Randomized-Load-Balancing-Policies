function [zeta] = zeta_BSQdK(d, K)
%

f = @(x) x^(K+1) - (1 + d/K) * x^K + d/K;
zeta = bisection_method(f,1,100,10^(-10));

end