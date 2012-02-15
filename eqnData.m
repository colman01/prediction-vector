function result = eqnData(bigK,resultZi,n_i,phi,L);

    [m n] = size(resultZi);
    result = zeros(n + L +1, n);
    [p q] = size(phi);
    
    
    for i=1:p
        for j=1:q
            result(n + 2 + i, j) = n_i(i)*phi(j)/n;
        end
    end
    
%     for i=1:n
%         for j =1:q
%             result(n + 2 + i, j) = n_i(i)*phi(j)/L;
%         end
%     end

    for j=1:n
        result(n + 1, j) = n_i(j)*bigK(j)/n;
    end

    lambda=2;
        for i=1:m
            for j=1:L
                result(i, j) = lambda;
            end
        end
end