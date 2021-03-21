function [ Fbar ] = fixed_point_identical_PHD_full(lam, d, w_range, alpha, A, Fbar0)
%

dw=w_range(2)-w_range(1);
mu=-A*ones(length(A),1);
N=length(w_range);
Fbar=zeros(1,N);

Fbar(1)=Fbar0;
h1=zeros(length(A),N);
h2=zeros(length(A),N);
h3=zeros(1,N);
h3(1)=1;


for n =1:N-1
    Fbar(n+1)=Fbar(n)-lam*d*dw*(h3(n)*(1-Fbar(n))+alpha*h1(:,n)-alpha*h2(:,n)*Fbar(n));
    h1(:,n+1)=h1(:,n)+dw*(A*h1(:,n)+mu*Fbar(n)^d);
    h2(:,n+1)=h2(:,n)+dw*(A*h2(:,n)+mu*Fbar(n)^(d-1));
    h3(:,n+1)=h3(:,n)-dw*h3(:,n);
    if Fbar(n+1) < 0
        Fbar(n+1:end)=Fbar(n+1);
        return
    end
end
end