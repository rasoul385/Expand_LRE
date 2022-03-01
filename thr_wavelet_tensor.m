 function Z = thr_wavelet_tensor(B,dt,type_wavelet,r)
%% Apply wavelet transform
display('Appling wavelet transform');
for i=1:size(B,1)
parfor j=1:size(B,2)
   dn= squeeze(B(i,j,:));
%    A(i,j,:,:) = cwt(dn,type_wavelet);
A(i,j,:,:) = cwt_fw(dn, type_wavelet, 32, dt);
end
end
%% thresholding singulare values
fprintf('thresholding singulare values...');
for i=1:size(A,4)
parfor j=1:size(A,3)
     f1=A(:,:,j,i);
AA=squeeze(f1);
[Shat] = optshrink(AA,r);
u(:,:,j,i)=Shat(:,:);
end 
end
% %% invers wavelet transform
fprintf('Calculating invers wavelet transform...');
tic;
for i=1:size(u,1)
for j=1:size(u,2)
    f1=u(i,j,:,:);
t1=squeeze(f1);
UU = cwt_iw(t1, type_wavelet);
 d1(i,j,:)=UU(:);

end
end
Z=d1;