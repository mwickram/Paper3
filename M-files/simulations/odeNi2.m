function y=odeNi2(t,x)
global V gama0 R0 eps Ch a b c K;
global delta R gg gama Alpha;

E=x(1:2:end);
theta=x(2:2:end);

coupling(1)=K*Alpha*(E(2)-E(1));
coupling(2)=K*(E(1)-E(2));


for k=1:2
    ind=(k-1)*2+1;
    y(ind)=(V-E(k))./R(k)-(Ch.*exp(0.5.*E(k))./(1+Ch.*exp(E(k)))+a.*exp(E(k))).*(1-theta(k)) + coupling(k);
    y(ind+1)=(1./gama(k)).*exp(0.5*E(k)).*(1-theta(k))./(1+Ch.*exp(E(k)))-(1./gama(k)).*b.*Ch.*exp(2.*E(k)).*theta(k)./(c.*Ch+exp(E(k)));
end
y=y';