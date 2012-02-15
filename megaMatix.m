function mega = megaMatix(K,n_i,phiMatrix,N,L,lambda);


mega = zeros(N+L,N+L);

% dataMatrix = dataMatrix(K,n_i,phiMatrix,L,lambda);

for i=1:N
    % copy row-wise
    mega(i,1:N) = K(i,:);
    mega(i,N+1:N+L) = phiMatrix(i,:);
end
j=1;

for i=1:N
    data = phiMatrix(j,:)';
    mega(N+1:N+L,i) = data;
    j = j+1;
end

end