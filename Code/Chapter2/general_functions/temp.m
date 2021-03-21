lam=1-10^(-15);
d=2;
w_range=linspace(0,100,10^5);

[Fbar, FRbar] = FRbar_LL_exp(lam, d, w_range);
Fbar2=(lam*exp(2*lam*w_range)-exp(2*lam*w_range)+1+lam)./(-lam*exp(2*lam*w_range)+exp(2*lam*w_range)+1+lam);
Fbar3=lam./(-lam*exp(lam*w_range)+exp(lam*w_range)+lam);

plot(w_range, Fbar)
hold on
plot(w_range, Fbar2)
plot(w_range, Fbar3)

legend