function [EQ, ER, EW] = LLdK_exp( lam, d, K, Gbar, g, w_range )
% Here we obtain the mean response time for LL(d,k,delta) 

dw=w_range(2)-w_range(1);

if K == 1
    EW=0;
    for n=1:10^7
        term = lam^(d*n)/(1+n*(d-1));
        EW = EW + term;
        if term < 10^(-20)
            break;
        end
    end
    ER = EW + 1;
    EQ = ER * lam;
else
    T = @(x) T_LLdK(lam, d, K, x);
    [Fbar] = compute_Fbar(T, lam, w_range);
    ER=zeros(1, K);
    for k=1:K
        FbarK=zeros(size(Fbar)); %k'th order statistic
        for i=0:(k-1)
            FbarK=FbarK+nchoosek(d,i)*(1-Fbar).^i.*Fbar.^(d-i);
        end
        FbarR=Gbar + convolution(g, FbarK, dw);
        ER(k) = trapz(FbarR)*dw;
    end
    ER = mean(ER);
    EW = ER - 1;
    EQ = ER * lam;
end

end