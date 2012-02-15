function result = generateLambda();

% n is the number of coefficients to be generated

% result = zeros(20,1);
index = 1;
for i=-10:10
    if (i == 0)
        continue
    else
    result(index) = 2^i;
    index = index + 1;
    end
end

end