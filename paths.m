function [pathvector] = paths(n,d,T,m,steps,sigma,r,x0)
%erzeugt Pfade der geometrischen, Brownschen Bewegung
by=T/m;
pathvector=zeros(n,d,steps+1);
pathvector(1:n,1:d,1)=x0;
for t=2:(steps+1)
    
    random=randn(n,d);
    
    for j=1:d
        
        pathvector(1:n,j,t)=pathvector(1:n,j,t-1)*exp(r*by);
        
        for k=1:d
           pathvector(1:n,j,t)=pathvector(1:n,j,t).*exp(sigma(j,k)*random(1:n,k)*sqrt(by)-0.5*sigma(j,k)^2*by);
        end 
    end
end

