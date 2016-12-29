function y=odeNi2(t,x)
global V Ch a b c;
global Rc gama area2 R2 alpha;

E=x(1:2:end);
theta=x(2:2:end);

coupling(1)=(E(2)-E(1))/(alpha*area2*Rc); % area2: area2 of small electrode when different electrode sizes
coupling(2)=(E(1)-E(2))/(area2*Rc);%alpha=area1/area2


R=area2*R2; %R2 resiatance of the small electrode

 

for k=1:2
    ind=(k-1)*2+1;
    y(ind)=(V-E(k))./R-(Ch.*exp(0.5.*E(k))./(1+Ch.*exp(E(k)))+a.*exp(E(k))).*(1-theta(k)) + coupling(k); %R=area
    y(ind+1)=(1./gama(k)).*exp(0.5*E(k)).*(1-theta(k))./(1+Ch.*exp(E(k)))-(1./gama(k)).*b.*Ch.*exp(2.*E(k)).*theta(k)./(c.*Ch+exp(E(k)));
end
y=y';