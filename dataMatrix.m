function [dataMatrix] = dataMatrix(K,n_i,phiMatrix,L,lambda);

% K is the vector from the bigK calculation
% count is a struct with the getOccurrences result
% occurrences and values
% phiMatrix is the 2000X6 power sequence 
% L is 6
% lambda is a coefficient from the generated 2^i
[a b] = size(K); % this should be 1 x 2000
[c d] = size(phiMatrix); % this should be 6 x 2000

[e N] = size(n_i);
s = N + L;
dataMatrix = zeros(s,s);


for i=1:b
    dataMatrix(1:a,i) = K(:,i);
end


% I = eye(N)*lambda ;
% dataMatrix = I + dataMatrix;
for i=1:N
    for j=1:N
        if(i == j)
            dataMatrix(i,j) = dataMatrix(i,j) + lambda;
        end
    end
end


for i=1:c
    for j=1:d
        phiMatrix(i,j)=phiMatrix(i,j)*n_i(i)/N;
    end
end 

for j=1:d
    dataMatrix(:,N+j) = phiMatrix(:,j);
end



end

