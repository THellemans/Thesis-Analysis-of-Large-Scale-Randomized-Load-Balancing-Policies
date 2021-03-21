function [ g, Gbar ] = erlang_dist(k, lam, x)
%

g=(lam^k .* x.^(k-1) .* exp(-lam.*x)) / (factorial(k-1));
Gbar=zeros(1,length(x));
for kk=0:(k-1)
    Gbar=Gbar+((lam*x).^kk .* exp(-lam .* x))/(factorial(kk));
end
g(isnan(g))=0;
Gbar(isnan(Gbar))=0;

end