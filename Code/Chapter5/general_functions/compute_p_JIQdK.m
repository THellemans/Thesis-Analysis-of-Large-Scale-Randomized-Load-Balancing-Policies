function [p] = compute_p_JIQdK(lam, d, K)
%

p = 0;
for j = 1:d
    p = p + min(j,K) *nchoosek(d, j) * (1-lam).^j .* lam.^(d-j);
end
p = p / K;

end