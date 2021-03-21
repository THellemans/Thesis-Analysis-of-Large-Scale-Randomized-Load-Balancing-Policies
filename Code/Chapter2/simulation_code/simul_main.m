function [mwloads, sloads, sresps, mresps]=simul_main(d,N,lam,jtype,sp1,sp2,tau,svals,nruns,runlen)
% jtype =1 => Exponential with mean 1
% jtype =2 => Hyperexponential with mean=1, SCV=sp1, f=sp2
% jtype =3 => Power law jobs with \bar G(w)=w^(-2) => E[G]=2!
% jtype =4 => Deterministic jobs of size 1
% tau = delay on the job.

mu=zeros(2,1); p=0;
if (jtype == 2)
    SCV=sp1;
    f=sp2;
    mu(1)=(SCV+(4*f-1)+((SCV-1)*(SCV-1+8*f*(1-f)))^(1/2))/(2*1*f*(SCV+1));
    mu(2)=(SCV+(4*(1-f)-1)-((SCV-1)*(SCV-1+8*f*(1-f)))^(1/2))/(2*1*(1-f)*(SCV+1));
    p=1*mu(1)*f;
end
sloads=zeros(nruns, length(svals));
sresps=zeros(nruns, length(svals));
mwloads=zeros(1,nruns);
mresps=zeros(1,nruns);
start_recording=0.3*runlen;
for nrun=1:nruns
    sload=zeros(size(svals));
    sresp=zeros(size(svals));
    wloads=zeros(1,N);
    ctime=0; octime=0;
    nm=0; mwload=0; nresp=0; mresp=0;
    while ctime < runlen
        iat=exprnd(1/(lam*N));
        ctime=ctime+iat;
        wloads=max(wloads-iat,0);
        
        if jtype==1
            jsize=tau+exprnd(1);
        elseif jtype==2
            jsize=tau+exprnd(1/mu(1+(rand>p)));
        elseif jtype==3
            jsize=tau+(rand)^(-1/2);
        else
            jsize=tau+1;
        end
        
        qids=ceil(rand(1,d)*N);
        [w,indx]=min(wloads(qids));
        wloads(qids(indx))=w+jsize;
        
        if (ctime > start_recording)
            sresp(w+jsize > svals)=sresp(w+jsize > svals)+1;
            mresp=mresp+w+jsize;
            nresp=nresp+1;
        end
            
        if (ctime > start_recording && ctime-octime > N*runlen/200000)
            mwload=mwload+sum(wloads)/N;
            for nsamp=1:N 
                sload((wloads(nsamp)>svals))=sload((wloads(nsamp)>svals))+1;
            end
            octime=ctime;
            nm=nm+1;
        end
    end
    mwloads(nrun)=mwload/nm;
    mresps(nrun)=mresp/nresp;
    sloads(nrun,:)=sload/(N*nm);
    sresps(nrun,:)=sresp/(nresp);
end
end