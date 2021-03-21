clear variables
addpath('../general_functions/identical_jobs/with_delay')

delta_range=linspace(0.01,4,400); tol=10^(-8);
MRT_holder=zeros(4,length(delta_range));
Fbar0_holder=zeros(4,length(delta_range));
lam=0.7; d=2;

for j=1:4
    if j==1
        w_range=linspace(0,200,10^5);
        alpha=[1 0];
        A=[-2 2; 0 -2];
        [ g, Gbar ] = erlang_dist(2, 2, w_range);
    elseif j==2
        w_range=linspace(0,200,10^5);
        alpha=1;
        A=-1;
        Gbar=exp(-w_range);
        g=exp(-w_range);
    elseif j==3
        w_range=linspace(0,200,10^5);
        [ alpha, A ] = hyperexponential_init_alphaA( 1, 2, 1/2 );
        [ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
    elseif j==4
        w_range=linspace(0,200,10^5);
        [ alpha, A ] = hyperexponential_init_alphaA( 1, 3, 1/2 );
        [ g, Gbar ] = hyperexponential_dist( alpha, A, w_range );
    end
    for i=1:length(delta_range)
        delta=delta_range(i);
        if i==1
            [ Fbar, FRbar, MRT, flag ] = get_MRT_delay_PHD(lam, delta, d, w_range, g, Gbar, alpha, A, tol,  0, 1);
        else
            [ Fbar, FRbar, MRT, flag ] = get_MRT_delay_PHD(lam, delta, d, w_range, g, Gbar, alpha, A, tol,  Fbar(1), 1);
        end
        if flag
            break
        end
        MRT_holder(j,i)=MRT; Fbar0_holder(j,i)=Fbar(1);
        save('../data/fig4_18.mat','MRT_holder','Fbar0_holder','delta_range','w_range')
    end
end