function data = Normalization( data , UB, LB )
if nargin<2
    UB = 1; 
    LB = -1;

Min = min(data);
Max = max(data);

for i = 1:numel(Min)
    data(:,i,i)=(data(:,i,i) - Min(i))/(Max(i) - Min(i));
end

data = (UB-LB)*data +LB;

end

