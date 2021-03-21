function [ Fbar ] = fixed_point_IDE_independent(lam, d, s_range, Gbar, g, Fbar0)
%

ds=s_range(2)-s_range(1);
lamdds=lam*d*ds;
Fbar=zeros(1,length(s_range));
Fbar(1)=Fbar0;
grev=g(end:-1:1);
for n=1:(length(s_range)-1)
    if (Fbar(n) < -10^(-6) || (n > 1000 && abs(Fbar(n) - Fbar(n-1000)) < 10^(-6)) )
        Fbar(n:end)=Fbar(n);
        return
    end
    FbarR=Gbar(n)+ds*(sum(grev(end-n+1:end).*Fbar(1:n))-0.5*(g(1)*Fbar(n)+g(n)*Fbar(1)));
    Fbar(n+1)=Fbar(n)-lamdds*FbarR^(d-1)*(FbarR-Fbar(n));
end
end