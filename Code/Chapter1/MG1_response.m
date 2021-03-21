function [ FRbar ] = MG1_response(lam, g, Gbar, w_range, tol)
%

EG=trapz(Gbar)*(w_range(2)-w_range(1));
p(1)=(1-lam*EG);
n=1;
while p(n) > tol
    a(n)=trapz((lam.*w_range).^(n-1)/factorial(n-1).*exp(-lam*w_range).*g)*(w_range(2)-w_range(1));
    p(n+1)=1/a(1)*(p(n)-(p(1)*a(n)));
    for i=2:n
        p(n+1)=p(n+1)-1/a(1)*(p(i) * a(n-i+2) );
    end
    n=n+1;
end

FWbar=zeros(1,length(w_range));
FWbar=FWbar+p(2)*Gbar;
Gbar_conv=Gbar;
for n=3:length(p)
    Gbar_conv=min(Gbar_conv+convolution(g, Gbar_conv, w_range(2)-w_range(1)),1);
    FWbar=FWbar+p(n)*Gbar_conv;
end

FRbar=Gbar+convolution(FWbar, g, w_range(2)-w_range(1));

end