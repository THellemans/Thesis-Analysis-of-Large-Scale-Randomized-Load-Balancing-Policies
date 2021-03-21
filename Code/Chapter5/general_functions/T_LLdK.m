function [TFbar] = T_LLdK(lam, d, K, x)
%

TFbar=0;
for j = 0:(K-1)
    TFbar = TFbar + lam * (K-j)/K * nchoosek(d,j) * x.^(d-j) * (1-x).^j;
end

end