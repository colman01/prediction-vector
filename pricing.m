function [ price ] = pricing( n,N,r,Szenario)
%PRICING Pricing of American Options via regression
% n is the number of simulated paths
% N is number of evaluations on new data
% r is interest rate
%  n=2000;
%  N=10000;
%  r=0.05;
%  Szenario=1;

x0=100; %starting value of the stocks

T=1;    %upper bound on time

%different number of underlying stocks
if (Szenario==1)
    m=48;   %number of time steps
    
    d=5;
    sigma=[0.3024 , 0.1354 , 0.0722 , 0.1367 , 0.1641;
      0.1354 , 0.2270 , 0.0613 , 0.1264 , 0.1610 ;
      0.0722 , 0.0613 , 0.0717 , 0.0884 , 0.0699 ;
      0.1367 , 0.1264 , 0.0884 , 0.2937 , 0.1394 ;
      0.1641 , 0.1610 , 0.0699 , 0.1394 , 0.2535];  %volatility matrix
else
	m=12;
	
    d=1;
	sigma=0.25;
end



estimates=zeros(N,m-1);
% contains already computed estimates

pathvectorPredict=paths(N,d,T,m,m,sigma,r,x0);


display('Estimate q_t')


for t=(m-1):(-1):1

	display(t)
	%Construct paths for estimation:
	pathvector_new=paths(n,d,T,m,t+1,sigma,r,x0);
	
	%regression:
    x_new=pathvector_new(:,:,index(t+1));
	if (Szenario==1)
        y_new=payoff1(x_new,t+1,r,m);
    else
        y_new=payoff2(x_new,t+1,r,m);
    end
    
	if t<(m-1)
		%q_t+1:
		Dummy=regression(x_old,y_old,[x_new;pathvectorPredict(:,:,index(t+1))]);
		y_new=max(y_new,Dummy(1:n));
		estimates(:,t+1)=Dummy((n+1):(n+N));
    end

	x_old=pathvector_new(:,:,index(t));
	y_old=y_new;

end


estimates(:,0+1)=regression(x_old,y_old,pathvectorPredict(:,:,index(0+1)));


% compute estimate for t=0:
t=0;
pathvector_new=paths(n,d,T,m,t+1,sigma,r,x0);
x_new=pathvector_new(:,:,index(t+1));
if (Szenario==1)
	y_new=payoff1(x_new,t+1,r,m);
else
	y_new=payoff2(x_new,t+1,r,m);
end

q=regression(x_old,y_old,x_new);
y_new=max(y_new,q);

estimate0=mean(y_new);


% evaluate stopping rule

display('Evaluate stopping rule')

sold=zeros(N,1);
money=zeros(N,1);

for t=0:m

	display(t)
	
	if ((0<t) && (t<m))
		estimate_akt=estimates(:,t);
    end
    
    for i=1:N
	
		if (sold(i)==0)
		
			% option not sold yet
			% compute payoff if we sell now
			if (Szenario==1)
				p=payoff1(pathvectorPredict(i,1:d,index(t)),t,r,m);
			else
				p=payoff2(pathvectorPredict(i,1:d,index(t)),t,r,m);
            end
			if (t==0)
				qt=estimate0;
            elseif (t==m)
				qt=0;
			else
				qt=estimate_akt(i);
            end
            
            if (qt<=p)
			
				sold(i)=1;
				money(i)=p;
            end
            
        end
    end
end

display(['Expected payoff is ' num2str(mean(money))])
price=mean(money);
end
