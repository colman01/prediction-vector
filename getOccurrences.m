    % For every element in the data, find out how often this 
    % element occurs 

    % z is a 2d vector
    % the data is [2d] * [a number of elements]
    % the number of times z occurs will be counted and this value returned
    %
    %
    % example [2 3 4 5 2 4 5 1 7] -> [2 3 4 5 1 7] [2 1 2 2 1 1 1]
    function count = getOccurrences( x_train)
%     function count = getOccurrences( x_train,y_train)
    
        [n m] = size(x_train);

        z = getUniqueMatrixVersion2(x_train); % no re-occurances should appear
        [a b] = size(z); % MAX <= m
        count = struct('count',zeros(1,a),'value',zeros(a,b));
        %%
        for j=1:a
            
            %% vec: the appropriate element from the z vector
            %  should be subtracted from ?
            vec = z(j,:);
            % reset the counter for the next distinct element
            resultOccurrences = 0;
            for i = 1:n;
                
            %% the n_i should be calculated  
            %  where only the X data is reponsible
            
                if vec == x_train(i,:)
    %             if vec == data(
                    resultOccurrences  = resultOccurrences  + 1 ;
                    count.count(j) = resultOccurrences ;
                    count.value(j,:) = vec;

                else
                
            end
                
        end
            
        end
        
    end