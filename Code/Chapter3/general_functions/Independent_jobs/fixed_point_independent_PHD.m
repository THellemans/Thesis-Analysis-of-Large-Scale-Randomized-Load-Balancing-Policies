function [ Fbar ] = fixed_point_independent_PHD(lam, d, w_range, Gbar, alpha, A, Fbar0)
%

dw=w_range(2)-w_range(1);
mu=-A*ones(length(A),1);
N=length(w_range);
Fbar=zeros(1,N);

Fbar(1)=Fbar0;
h=zeros(length(A),N);
lamddw=lam*d*dw;

for n =1:N-1
    Fbar(n+1)=Fbar(n)-lamddw*(Gbar(n) + alpha*h(:,n))^(d-1) * (Gbar(n)+alpha*h(:,n)-Fbar(n));
    h(:,n+1)=h(:,n)+dw*(A*h(:,n)+Fbar(n)*mu);
    if Fbar(n)<-10^(-6)
        Fbar(n:end)=Fbar(n);
        return
    end
end
end