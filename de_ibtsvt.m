function LU=de_ibtsvt(data,dt,nIter,eplison,p,o,t,type_wavelet,r)
% niter is number of iteration. p,o and t is  size of block spliting and
% beta:     aspect ratin m/n of the m-by-n matrix whose singular values 
%             are given
%   loss:     the loss function for which the shrinkage should be optimal
%             presently implmented: 'fro' (Frobenius or square Frobenius norm loss = MSE)        
%                                   'nuc' (nuclear norm loss)
%                                   'op'  (operator norm loss)
%   sigma:    (optional) noise standard deviation (of each entry of the noise matrix) 
%             if this argument is not provided, the noise level is estimated 
%             from the data.
X = data(:,:,:);
X_size = size(X); 
rho =2;error =0;
block_sizes=[p,o,t];
levels = size(block_sizes,1);
ms = block_sizes(:,1);
ns = block_sizes(:,2);
vs = block_sizes(:,3);
N1 = max(ms,ns);
% lambdas = 26./sqrt(N1*vs);
L = X; LU = X;
for it = 1:nIter
it
% compute the low rank component
L = blockSVT_tensor( L,dt, block_sizes,type_wavelet,r);  
E = X - L;
ERROR = LU-L;
error = norm(ERROR(:),'fro')./norm(X(:),'fro');
LU = L;
if (eplison > error)
    break;
end
% if issparse(data)
%     LU = sparse(LU);
% end
end

