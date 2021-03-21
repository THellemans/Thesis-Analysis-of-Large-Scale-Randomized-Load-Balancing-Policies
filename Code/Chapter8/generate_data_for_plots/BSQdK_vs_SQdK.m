addpath('../general_functions')
addpath('../../Chapter 1')

dfracK_iter = 2:5;
K_range = 1:10;
heavy_frac = zeros(length(dfracK_iter), length(K_range));

for i = 1:length(dfracK_iter)
    dfracK=dfracK_iter(i);
    for j = 1:length(K_range)
        K = K_range(j);
        d = K * dfracK;
        [zeta] = zeta_BSQdK(d, K);
        heavy_frac(i,j) = log(zeta) / log(d/K);
    end
end

save('../data/BSQdK_vs_SQdK1.mat', 'heavy_frac', 'K_range')

K_iter = 2:5;
dfracK_range = 1:10;
heavy_frac = zeros(length(K_iter), length(dfracK_range));

for i = 1:length(K_iter)
    K=K_iter(i);
    for j = 1:length(dfracK_range)
        dfracK = dfracK_range(j);
        d = K * dfracK;
        [zeta] = zeta_BSQdK(d, K);
        heavy_frac(i,j) = log(zeta) / log(d/K);
    end
end

save('../data/BSQdK_vs_SQdK2.mat', 'heavy_frac', 'dfracK_range')