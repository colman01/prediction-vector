function result = LTwoRisk(gStar_outcome, testData_y, learnDim, testDim);

[N m] = size(testDim);
[L k] = size(learnDim);
a=0;
for i=1:N
   a= a + abs(gStar_outcome(i)-testData_y(i))^2;
end
a = a/N;

result = a;

end