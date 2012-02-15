repitition=100;
n=50;
N=250;
r=0.05;
Szenario=2;
file=['Pricing_Szenario' num2str(Szenario) '.mat'];

values=zeros(repitition,1);
for k=1:repitition
    
    values(k)=pricing(n,N,r,Szenario);
    display(values(1:k))
    save(file,'values')
    
end
boxplot(values)
