function [ y_predict ] = regression( x_train,y_train,x_predict )
%REGRESSION Summary of this function goes here
%   Detailed explanation goes here
% x_extra=[ones(size(x_train,1),1),x_train];
% b=mvregress(x_extra,y_train);
% y_predict=[ones(size(x_predict,1),1),x_predict]*b;


[bestLambda] = algorithmVersion(x_train, y_train);

y_predict = getYpredict( x_train,y_train,x_predict,bestLambda );



end

