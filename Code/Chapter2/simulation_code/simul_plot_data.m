function [svals, sloads, sresps, conf_loads, conf_resps, mwloads, mresps] = simul_plot_data(d,N,lam,jtype,sp1,sp2,tau,svals,nruns,runlen)
[mwloads, sloads, sresps, mresps]=simul_main_mex(d,N,lam,jtype,sp1,sp2,tau,svals,nruns,runlen);
conf_loads=zeros(size(svals));
conf_resps=zeros(size(svals));

for i=1:size(svals,2)
    tmp=sloads(:,i);
    zhat=sum(tmp)/nruns;
    Vhat=(sum(tmp.^2)-nruns*zhat.^2)/(nruns*(nruns-1));
    conf_loads(i)=1.96*sqrt(Vhat);
end

for i=1:size(svals,2)
    tmp=sresps(:,i);
    zhat=sum(tmp)/nruns;
    Vhat=(sum(tmp.^2)-nruns*zhat.^2)/(nruns*(nruns-1));
    conf_resps(i)=1.96*sqrt(Vhat);
end

end