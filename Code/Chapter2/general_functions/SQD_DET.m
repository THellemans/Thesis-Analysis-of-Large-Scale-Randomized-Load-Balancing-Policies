d=2;
lam=0.05;
qbound=30;

Q=[1 zeros(1,qbound)];
Qbar=[cumsum(Q,'reverse') 0]; 
% all queues empty

%Q(i) gives law of environment, Qbar(i) = sum_j>=i Q(i)
%Jdist(i+1) gives probability that cavity gets arrival given its queue = i
Qold=zeros(1,qbound+1);
Qrand=Q;
Qrandbar=[cumsum(Qrand,'reverse') 0];
while (abs(Qrand(1)-(1-lam)) > 10^(-12))
    Qold=Q;
    for i=0:qbound
        Jdist(i+1)=0;
        for k=0:d-1
            Jdist(i+1)=Jdist(i+1)+nchoosek(d-1,k)*Qrand(i+1)^k*Qrandbar(i+2)^(d-1-k)/(k+1);
        end
    end
    Jdist=max(Jdist,0);
    lams=lam*d*Jdist;
    Qmat=expm(-diag(lams)+diag(lams(1:qbound),1)); % num of arrivals in [0,1]
    Qmat(2:end,:)=[Qmat(2:end,2:end) zeros(qbound,1)];
    Qmat(1,:)=Qmat(2,:);
    Q=stat(Qmat);
    
    % determine state Qrand at random point in time
    lamMat=-diag(lams)+diag(lams(1:qbound),1); % num of arrivals in [0,1]
    % store int_0^1 exp(lamMat*s) ds in X
    % assuming lamMat^qbound/factorial(qbound+1) is small enough
    % that is, qbound is large enough
    X=lamMat/qbound;
    for n=qbound-1:-1:2
        X=(X+eye(qbound+1))*lamMat/n;
    end
    X=X+eye(qbound+1);
    X(1,:)=X(2,:);
    
    Qrand(1)=Q(1)/lams(1)/(1+Q(1)/lams(1));
    Qrand(2:qbound+1)=zeros(1,qbound);
    for i=1:qbound
        for j=0:i %state at previous serv. completion
            Qrand(i+1)=Qrand(i+1)+Q(j+1)/(1+Q(1)/lams(1))*X(j+1,i+1);
        end
    end
    Qrandbar=[cumsum(Qrand,'reverse') 0];
end

mrespSQDdet=sum(Qrandbar(2:end))/lam