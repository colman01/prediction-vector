function y_predict = getYpredict( x_train,y_train,x_predict,lambda );

[n d] = size(x_train);
[xp_h xp_w] = size(x_predict);



if(d == 1)
    k = 2;
else
    k = ceil(d/2);
end

T = theta (k,d);


L = setL(d,k);

% defining the unique values of x_train and their occurrences
occurrences = getOccurrences( x_train);

z_i = occurrences.value;
n_i = occurrences.count;
[N z_w] = size(z_i);

% to be fix to correct entries
% function result = MonomialMatrix(vec,k,l,N)
monoMatrix = MonomialMatrix(x_train,k,L,N,d);



correctK = zeros(N,N);


for i=1:N
    for j=1:N
        if(i == j)
            correctK(i,j) = lambda;
        else
        diff = z_i(i) - z_i(j); % K(z1 - z2) .... K(z1 -zn)

        correctK(i,j) = occurrences.count(i)/n *  bigK(diff,k,d);
        end
    end
end

A = megaMatix(correctK,n_i,monoMatrix,N,L,lambda);

 X = rightHandSideVersion3(x_train,y_train,z_i,L);
 X = X';
 
coefficientVector = linsolve(A,X);

% v=zeros(size(x_predict),L);
v=MonomialMatrix(x_predict,L,k,xp_h,xp_w);

for i=1:xp_h
    % result = gStar(coefficientVector,z_i,x,N,L,k,v_row);
%     y_predict(i) = gStar(coefficientVector,z_i,x_predict(i),N,L,k,monoMatrix,d);
%                     gStar(coefficientVector,z_i,x,N,L,k,v_row,d);
        y_predict(i) = gStar(coefficientVector,z_i,x_predict(i),N,L,k,v(i,:),d);
end
y_predict = y_predict';

end