function resultZi = getZi(data)

    n_i = data.count;
    % this could also be a vector
    z_i = data.value;
    
    length = size(n_i);

    Karray = zeros(1,length(2));

    for i=1:length(2);
        Karray(i) = bigK(z_i(i,:)); 
    end
    resultZi = Karray;

end