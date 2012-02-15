function result = removeNan(matrix);


[n m] = size(matrix);


index = 1;

for i=1:n
    if( isnan(matrix(i,1)) )
        continue;
    else
        result(index,:) = matrix(i,:);
        index = index +1;
    end
end

end
