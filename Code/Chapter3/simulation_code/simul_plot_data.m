function [svals, sloads, conf_loads] = simul_plot_data(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen)

[sloads]=simul_main_mex(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen);
conf_loads=zeros(size(svals));

for i=1:size(svals,2)
    tmp=sloads(:,i);
    zhat=sum(tmp)/nruns;
    Vhat=(sum(tmp.^2)-nruns*zhat.^2)/(nruns*(nruns-1));
    conf_loads(i)=1.96*sqrt(Vhat);
end

end