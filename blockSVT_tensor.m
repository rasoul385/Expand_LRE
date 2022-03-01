function Z = blockSVT_tensor( Z,dt, block_size,type_wavelet,r)
% Block-wise singular value thresholding
% 
% Inputs:
% Z          -    input tensor
% lambda     -    threshold
%

blockSVT_tensorfun = @ (X) thr_wavelet_tensor( X,dt,type_wavelet,r);
% Z = @ (X) SVT_tensor( X,beta,lose_func);

Z = blkproc_tensor( Z, block_size, blockSVT_tensorfun);
% blkproc not recommended in Matlab, but way faster than blockproc...

