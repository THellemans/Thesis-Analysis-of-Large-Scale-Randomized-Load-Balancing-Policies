addpath('../../general_functions')
clear variables
w_range=linspace(0,30,10^3);

%% 0.5251 * Erlang(k, 1/k) with prob. 0.9523 for k=1,3,5,10, 15

q=0.9523;
k_PHs=[1,3,5,10,15];
E_cond_w=zeros(length(k_PHs), length(w_range));
EX1=0.5251;

idxs=1:length(k_PHs);
for idx = idxs
    k_PH=k_PHs(idx);
    [alpha, A, ~] = hyper_erlang_init(q, k_PH, EX1);
    A_inv=A^(-1); 
    [E_cond_w(idx,:)] = E_cond(alpha, A, A_inv, w_range) - w_range;
end
save('../../data/fig14c.mat', 'E_cond_w', 'w_range')