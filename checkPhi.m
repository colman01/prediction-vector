function result = checkPhi(phiMatrix, coefficentVector)
    [a b] = size(phiMatrix); %2000x6
    [c d] = size(coefficentVector; % size n + L expected
    
    for j=1:d
        mu = coefficentVector(j,:);
        for i=1:a
            temp = phiMatrix(i,:);
            result(i,j) = temp*mu;
        end
    end
end