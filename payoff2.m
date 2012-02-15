function [payoff] = payoff2(x,t,r,m)
%put payoff
strike=90;

xmean=mean(x,2);
payoff=(strike-xmean).*(xmean<=strike);
payoff=exp(-r*t/m)*payoff;



end

