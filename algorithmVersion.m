function [bestLambda] = algorithmVersion(x_train, y_train);

%% step 1 .
% split the train data arbitrarily

[N x_w] = size(x_train);

[N_y y_w] = size(y_train);

midValue = ceil(N/2);

learningData_x    = zeros(midValue, x_w);
testData_x        = zeros(N - midValue, x_w);
learningData_y    = zeros(midValue, y_w);
testData_y        = zeros(N - midValue, y_w);

for i=1:midValue
    learningData_x(i,:) = x_train(i,:);
    learningData_y(i,:) = y_train(i,:);
end

learnDim = size(learningData_x );

index = 1;
for i=midValue+1:N
    testData_x(index,:) = x_train(i,:);
    testData_y(index,:) = y_train(i,:);
    index = index + 1 ;
end

testDim = size(testData_x);

%% step 2.
% Initaluize for all \lambda_n elementof Q_n with 
% D_{n_l} the regression funtion

% m_^{\lambda_i}{n_l} ( . ) = m_^{\lambda_i}{n_l} ( . , D_{n_l}) 

% resultVector = checks(x,y);
% [a b] = size(x);
% [c d] = size(y);
lambda = generateLambda(); %{2^-10 , ... ,2^10}
[a n] = size(lambda);



% Takes one parameter and initalizes the algorithm
% at initalization use the learning data
%initalParameter = lambda(1);
gStar_outcome = zeros(n,1);
riskResult = zeros(n,1);



%% step 3.
% Calculate the error 

% min_{n elementof Q_n} 1 / n_1 \sigma^{n_l + n_t}_{i = n_l + 1 } 
% |m^{h}_{n_l} (X_i) - Y_i| ^2
%
% N = n_t + n_l
for j=1:n

        gStar_outcome = getYpredict( learningData_x,learningData_y,testData_x,lambda(j) );
        riskResult(j) = LTwoRisk(gStar_outcome, testData_y, learnDim, testDim);

end

% valueMinRisk = min(riskResult);
% indexMinRisk = find(riskResult);
[valueMinRisk,indexMinRisk]=min(riskResult, [ ],1)

bestLambda = lambda(indexMinRisk);





% dataMatrix = dataMatrix(K,count,phiMatrix,L,lambda);

 
 

% % diff = 0;
% % 
% % for i=1:a
% % %     for j=1:d
% %         for k=1:a
% % %         difference = d
% %             y_predictTest = getYpredict( x_train,y_train,learningData,lambda(k));
% %             difference(i,:) = y_predict - y_predictTest;
% %         end
% %         
% % %     end
% % end
% % 
% % for i=1:a
% %     minVal = min(difference(i,:))
% % end
% % minVal = min(minVal);
% % 
% % min_y_predict = getYpredict( x_train,y_train,learningData,lambda(minVal));

%step 4.

% m_{n}(x) =  = m_{n}(x,D_n) = m_{n_l}^(H) ( x, D_{n_l} )
% result = addition;

% parameter is now know
  % finalYPredict = getYpredict( learningData_x,learningData_y,testData_x,bestLambda );




end