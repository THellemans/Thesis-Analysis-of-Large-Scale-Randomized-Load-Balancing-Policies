function [ Fbar ] = fixed_point_identical_delay_PHD(lam, delta, d, w_range, Gbar, alpha, A, Fbar0)
%

delta_indx=find(w_range < delta, 1, 'last' );
ds=w_range(2)-w_range(1);
mu=-A*ones(length(A),1);
N=length(w_range);
Fbar=zeros(1,N);

Fbar(1)=Fbar0;
h1=zeros(length(A),N);
h2=zeros(length(A),N);
h3=zeros(length(A),N);
lamdds=lam*d*ds;
for n =1:N-1
    if n <= delta_indx
        Fbar(n+1)=Fbar(n)-lamdds*(Gbar(n)+alpha*h1(:,n)-Fbar(n));
        h1(:,n+1)=h1(:,n)+ds*(A*h1(:,n)+Fbar(n)*mu);
    else
        Fbar(n+1)=Fbar(n)-lamdds*(Gbar(n)-Fbar(n)*Gbar(n-delta_indx)+alpha*(h1(:,n)+h2(:,n)-h3(:,n)*Fbar(n)));
        h1(:,n+1)=h1(:,n)+ds*A*h1(:,n);
        h2(:,n+1)=h2(:,n)+ds*(Fbar(n-delta_indx)^(d-1)*Fbar(n)*mu+A*h2(:,n));
        h3(:,n+1)=h3(:,n)+ds*(Fbar(n-delta_indx)^(d-1)*mu+A*h3(:,n));
    end
    if Fbar(n)<-10^(-6)
        Fbar(n:end)=Fbar(n);
    end
end
end