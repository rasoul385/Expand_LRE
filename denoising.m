% denoising 
clc;close all;clear all;
load  syn_data_2layer_snr=-4.mat

addpath(genpath('wavelet_toolbox_rs'));
dd=data;
ddn=datan;
snrint=snr(A(:),ddn(:)-A(:))
%% denoising by proposed
tic
r=2;eplison=10;iter=14;
blocksiwze=[100 100 340];
a=blocksiwze(1);b=blocksiwze(2);c=blocksiwze(3);
de_tr_porposed_method=de_ibtsvt( ddn,dt,iter,eplison,a,b,c,'morlet',r);
tic_proposed=toc;
snrporposed=snr(A(:),de_tr_porposed_method(:)-A(:));
%% plot Results  
figure
subplot(1,2,1)
seismic_plot_3D(A,A,0,0,0)
ax.FontSize=5;
title('data free noise ')
xlabel('Crossline','FontSize',10);ylabel('Inline','FontSize',10);zlabel('Time(s)','FontSize',10)
subplot(1,2,2)
ax.FontSize=5;
seismic_plot_3D(ddn,ddn,0,0,0)
title(' noisey data ')
xlabel('Crossline','FontSize',10);ylabel('Inline','FontSize',10);zlabel('Time(s)','FontSize',10)
% %%
figure
subplot(1,2,1)
ax.FontSize=5;
seismic_plot_3D(de_tr_porposed_method,de_tr_porposed_method,0,0,0);
title('denoised p-method '),
xlabel('Crossline','FontSize',10);ylabel('Inline','FontSize',10);zlabel('Time(s)','FontSize',10)
subplot(1,2,2);
ax.FontSize=5;
seismic_plot_3D(ddn-de_tr_porposed_method,ddn-de_tr_porposed_method,0,0,0)
title('difrrence betwen noisy data and p-method ')
xlabel('Crossline','FontSize',10);ylabel('Inline','FontSize',10);zlabel('Time(s)','FontSize',10)


