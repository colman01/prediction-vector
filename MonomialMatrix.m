% function result = createMonomialMatrix(input,L,k,N);
%input=[1 2 3 4 5]; 
%n=5;
% l=6;
%MonomialMatrix = zeros(N,l);
% [n m]= size(input);
% MonomialMatrix = zeros(N,L);
% if (m==1)||(n==1)
%       for i=1:N
%           for j=1:L
%               % x^1* ... * x^n
%               MonomialMatrix(i,j) = input(i)^ceil(k.*rand);
%           end
%       end
%   else
%      %multi dimentional case is to be written
% end
%    
%   result = MonomialMatrix;
% 
% end


function result = MonomialMatrix(vec,k,l,N,d)
%vectora koito sam dal e row vector a koito e v programata e column vector
%vec=vec' ako e vector triabva da e column vektor;
% d=0;
% N=0;
% [N d] = size(vec);
A=zeros(N,l);

D=zeros(d,d);
    if (N==1)||(d==1)
       for i=1:N
           a=0;
           for j=1:l
               A(i,j)=vec(i)^a;
               a=a+1;
           end
       end

    else

    end
    
    result = A;
end













function result = MonomialMatrix(vec,k,l,N,d)
%vectora koito sam dal e row vector a koito e v programata e column vector
%vec=vec' ako e vector triabva da e column vektor;
% d=0;
% N=0;
% [N d] = size(vec);
A=zeros(N,l);

D=zeros(d,d);
    if (N==1)||(d==1)
       for i=1:N
           a=0;
           for j=1:l
               A(i,j)=vec(i)^a;
               a=1+1;
           end
       end

    else

    end
    
    result = A;
end









