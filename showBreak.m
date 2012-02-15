function elements = showBreak
A = [1 ,2, 3,4,5,6,5,3,2,2,3];
B = [74,2,3,5,6,8,3,2];
index =1;
for i=1:11
    for j=1:8
         if (A(i) == B(j))
            element = B(j);
            elements(index) = element;
            index = index + 1;
            break;  
         end

    end
end

end