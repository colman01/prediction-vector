
function result = gStar(coefficientVector,z_i,x,N,L,k,v_row,d);
% function result = gStar(z,x_predict,coefficientVector,l)

    a=0;
    b=0;
[n m]=size(z_i);
% v=zeros(size(x_predict),L);
% v=MonomialMatrix(x_predict,L,k,N);
y=zeros(m,n);
 for i=1:N
     y(i)=x-z_i(i);
 end
  for i=1:N
     y(i)=bigK(y(i),k,d);
  end
 for i=1:N
    a = a + coefficientVector(i)*y(i);
 end
     
h=1;
  for j=N+1:N+L
      b= b + coefficientVector(j)*v_row(h);
      h = h + 1;
  end
 
 
 result = a + b;
 
    
end