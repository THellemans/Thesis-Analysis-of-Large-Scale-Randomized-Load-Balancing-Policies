function [FRbar] = FRbar_SQ_exponential(lam, d, w_range, tol)
%

FRbar=zeros(size(w_range));
for n=0:10^5
    temp=lam^((d^n-1)*d/(d-1))/factorial(n);
    FRbar=FRbar+temp.*w_range.^n.*exp(-w_range);
    if temp<tol
        break
    end
end

end