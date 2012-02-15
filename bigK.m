 function resultBigK = bigK(z,k,d);
%function resultBigK = bigK(z);
[n m] = size(z);

for i=1:m
%%
% z = value(i);
 if(mod(d,2))
     %% odd
     resultBigK(i) = theta(k,d)*norm(z)^(2*k - d);

 else
     %% even
     resultBigK(i) = theta(k,d)*norm(z)^(2*k - d)*log(norm(z));
 end
end

end