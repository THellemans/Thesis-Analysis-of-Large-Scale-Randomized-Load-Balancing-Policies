function [ Fbar ] = fixed_point_identical(lam, d, w_range, Gbar, g, Fbar0)
%

dw=w_range(2)-w_range(1);
N=length(w_range);
Fbar=zeros(1,N);
Fbardmin1=zeros(N,1);
Fbard=zeros(N,1);
grev=fliplr(g);

Fbar(1)=Fbar0;
Fbardmin1(1)=Fbar(1)^(d-1);
Fbard(1)=Fbar(1)^d;

for n = 1:(N-1)
    Fbar(n+1)=Fbar(n)-lam*d*dw*(Gbar(n)*(1-Fbar(n))+dw*...
        grev(N-n+1:N)*(Fbard(1:n)-Fbardmin1(1:n)*Fbar(n)));
    Fbar(n+1)=Fbar(n+1)+lam*d*dw^2*(g(1)*Fbard(n)+g(n)*Fbard(1)-...
                 (g(1)*Fbardmin1(n)+g(n)*Fbardmin1(1))*Fbar(n))/2;
    Fbardmin1(n+1)=Fbar(n+1)^(d-1);
    Fbard(n+1)=Fbar(n+1)^d;
    if Fbar(n)<0
        Fbar(n:end)=Fbar(n);
        return
    end
    if n > 100
        if abs(Fbar(n)-Fbar(n-10^2)) < (w_range(2))/100
            Fbar(n:end)=Fbar(n);
            return
        end
    end
end
end