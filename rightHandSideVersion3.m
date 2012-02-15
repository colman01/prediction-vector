function result = rightHandSideVersion3(x_train, y_train,z_i,L);

    

    [n b] = size(x_train); % if dimenstion is d > 1
    [c d] = size(y_train); % for comparision to occur the
                           % dimentions should be the same
    [N f] = size(z_i);
    

    sum = 0;
    % will contain the value of way where the occurrence 
    % matched
    sum  = N+L;
    elements = zeros(1,sum);
    
    for i=1:N
        for j=1:n
            if(x_train(j) == z_i(i))
                elements(i) = elements(i) + y_train(j);
               
            end
        end
       
    end
    elements = elements / n;
    result = elements;    
    
end