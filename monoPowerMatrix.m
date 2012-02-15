function matrix = monoPowerMatrix(seed,data)

    [N d] = size(data);
    p1 = perms(seed);
    a = getUniqueMatrixVersion2(p1);
    
    [L d] = size(a);
    matrix = zeros(N,L);
    
    for i=1:N
        for j=1:L
            value = getProduct(a(j,:),data(i,:));
            matrix(i,j) = value;
        end
    end
    
    
    function result = getProduct(aa,xx)
        [aaL b1] = size(aa);
        [xxN b2] = size(xx);
        result = 0;
        for i=1:xxN
            for j=1: aaL
                value = xx(j)^(aa(i));
                result = result + value;
            end
        end
    end
    



end