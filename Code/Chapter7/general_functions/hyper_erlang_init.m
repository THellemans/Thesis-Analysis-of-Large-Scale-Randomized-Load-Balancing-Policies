function [alpha, A, mu] = hyper_erlang_init(q, k, EX1)
%

EX2 = (1-q*EX1)/(1-q);
alpha=zeros(1,2*k);
alpha(1)=q; alpha(1+k)=1-q;

A=-k*eye(2*k) + k* diag(ones(2*k-1,1), 1);
A(:, 1:k) = A(:, 1:k) / EX1;
A(:, (k+1):end) = A(:, (k+1):end) / EX2;
A(k, k+1) = 0;
mu = -A*ones(2*k, 1);

end