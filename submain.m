function result = submain

    % x_train , y_train
    % 
    x_train = rand(50,1);
    x_test  = rand(50,1);
    
    y_train = rand(50,1);
    
    eqnDataResult = checks(x_train,y_train,2);
    result = eqnDataResult ;
    

end