d=2;
K_iter = 2:6;
xx=linspace(1,2, 10^5);
pxx=zeros(length(K_iter), length(xx));

for i=1:length(K_iter)
    K=K_iter(i);
    pxx(i, :) = xx.^(K+1) - (1+d./K).*xx.^K+d./K;
end

save('../data/fig_px_BSQdK1.mat', 'd', 'K_iter', 'xx', 'pxx')


d=5;
K_iter = 2:6;
xx=linspace(1,4, 10^5);
pxx=zeros(length(K_iter), length(xx));

for i=1:length(K_iter)
    K=K_iter(i);
    pxx(i, :) = xx.^(K+1) - (1+d./K).*xx.^K+d./K;
end

save('../data/fig_px_BSQdK2.mat', 'd', 'K_iter', 'xx', 'pxx')
