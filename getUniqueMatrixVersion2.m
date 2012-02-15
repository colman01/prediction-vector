function result = getUniqueMatrixVersion2(x_train);
    
    [n m] = size(x_train);
    
    for i=1:n
        vec = x_train(i,:);
        
        for j=1:n;
            
            if(i ~= j)
                compare = x_train(j,:);
                isZero = compare - vec;
                if(isZero == 0)
                    x_train(j,:) = NaN;
                end
            end
        end  
    end
    i_i = 0;
    j_j = 0;
    for i=1:n
        i_i = i_i +1;
        for j=1:m
            j_j = j_j +1;
            if(x_train ~= NaN)
                result(i_i,:) = x_train(i,:);
            end
        end
    end
    
     result = removeNan(result);
end