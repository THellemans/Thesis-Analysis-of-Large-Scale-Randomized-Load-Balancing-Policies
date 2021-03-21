d=2;
N=10;
lam=0.5;
jtype=1;
sp1=1;
sp2=1;
svals=linspace(0,20,40);
nruns=10;
runlen=10;

[mwloads, sloads, sresps]=simul_main(d,N,lam,jtype,sp1,sp2,0,svals,nruns,runlen);