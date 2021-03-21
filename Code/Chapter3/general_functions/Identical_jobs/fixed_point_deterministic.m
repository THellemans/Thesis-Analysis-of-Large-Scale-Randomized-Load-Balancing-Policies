function [ Fbar ] = fixed_point_deterministic(lam, d, w_range, Fbar0)
%

Fbar=zeros(1,length(w_range));
w1=find(w_range<1, 1, 'last' );
dw=w_range(2)-w_range(1);

Fbar(1:w1)=1-(1-Fbar0)*exp(lam*d*w_range(1:w1));
for n = (w1+1):length(Fbar)
   Fbar(n)=Fbar(n-1)+dw*lam*d*(Fbar(n-1)-Fbar(n-w1))*Fbar(n-w1)^(d-1);
   if Fbar(n) < 0
   	   Fbar(n:end)=Fbar(n);
       return
   end
end
end