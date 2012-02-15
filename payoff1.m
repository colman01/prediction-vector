function [payoff] = payoff1(x,t,r,m)
%strangle spread payoff
strike1=75;
strike2=90;
strike3=110;
strike4=125;

xmean=mean(x,2);
payoff=(strike2-strike1)*(xmean<=strike1)+(strike2-xmean).*(strike1<xmean & xmean<=strike2)...
+(xmean-strike3).*(strike3<xmean & xmean<=strike4)+(strike4-strike3)*(strike4<xmean);
payoff=exp(-r*t/m)*payoff;



end

