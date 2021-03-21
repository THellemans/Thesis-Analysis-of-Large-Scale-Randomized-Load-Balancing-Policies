d=2;
N=10;
lam=0.5;
sp1=1; sp2=1; sp3=1;
jtype=1;
svals=linspace(0,10,20);
nruns=5;
runlen=10;

[wloads_holder, times]=simul_mwload(d,N,lam,jtype,sp1,sp2,sp3,nruns,runlen);