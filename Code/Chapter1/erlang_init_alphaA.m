function [ alpha, A ] = erlang_init_alphaA(k, lam)
%

alpha=zeros(1, k);
alpha(1)=1;
A=-lam*eye(k)+lam*diag(ones(k-1,1),1);

end