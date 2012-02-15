function result = generateSomeData();

    a =1;b=1;c=1;
    for i=1:100
        a = a*2;
        b = b*5;
        c = c*7;
        
        a = mod(a,5);
        b=  mod(b,15);
        c = mod(c,20);
        
        result(i,:) = [a,b,c];
    end
    


end