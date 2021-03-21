function [sloads]=simul_main(d,N,lam,jtype,sp1,sp2,sp3,svals,nruns,runlen)
%

% jtype =1 => Exponential with mean 1
% jtype =2 => Hyperexponential with mean=1, SCV=sp1, f=sp2
% jtype =3 => Power law jobs with \bar G(w)=w^(-2) => E[G]=2!
% jtype =4 => Deterministic jobs of size 1

mu=zeros(2,1);p=0;lb=0;ub=0;alpha=0;jsize=0;sampresp=0;
if (jtype == 2)
    EX=1;
    SCV=sp1;
    f=sp2;
    mu(1)=(SCV+(4*f-1)+((SCV-1)*(SCV-1+8*f*(1-f)))^(1/2))/(2*EX*f*(SCV+1));
    mu(2)=(SCV+(4*(1-f)-1)-((SCV-1)*(SCV-1+8*f*(1-f)))^(1/2))/(2*EX*(1-f)*(SCV+1));
    p=EX*mu(1)*f;
elseif (jtype == 3)
    lb=sp1;
    ub=sp2;
    alpha=sp3;
end

sloads=zeros(nruns, length(svals));
start_recording=0.3*runlen;

for nrun=1:nruns
    sload=zeros(size(svals));
    wloads=zeros(1,N);
    ctime=0; octime=0; nm=0;
    while ctime < runlen
        iat=exprnd(1/(lam*N));
        ctime=ctime+iat;
        wloads=max(wloads-iat,0);
        qids=ceil(rand(1,d)*N);
        [w,~]=min(wloads(qids));
        if (jtype==1)
            jsize=exprnd(1);
        elseif (jtype==2)
            phase=1+(rand(1)> p);
            jsize=exprnd(1/mu(phase));
        elseif (jtype==4)
            jsize=1;
        elseif (jtype==3)
            jsize=(-(rand() .*(1-(lb/ub).^alpha)-1)./(lb.^alpha)).^(-1/alpha);
        end
        wloads(qids)=max(wloads(qids), w+jsize);
            
        if (ctime > start_recording && ctime-octime > N*runlen/200000)
            for nsamp=1:N 
                sload((wloads(nsamp)>svals))=sload((wloads(nsamp)>svals))+1;
            end
            octime=ctime;
            nm=nm+1;
        end
    end
    sloads(nrun,:)=sload/(N*nm);
end
end