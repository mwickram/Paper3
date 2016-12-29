
function figure3

% Two 1:1 Ratio

d=load('Am031111.dat');   
alpha=1;
area2=1;

r_area=area2*alpha/(1+alpha);

delta_f=d(:,2)-d(:,3); % fast oscillator first ; 

rf=delta_f/delta_f(end);
rc=1./(2*r_area*d(:,1)*delta_f(end));
data=[d(:,1) rc rf]


fc=16;

h=subplot(2,2,1);

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok');
xlim([-0.3 14]);ylim([-0.04 1.2])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('\itK\rm_r')
set(g(1),'markerfacecolor','k','Linewidth',2)


h=subplot(2,2,2);



set(h,'fontsize',fc,'FontName','Arial')

omega_inf=mean(d(end,2:3));
col=12;
q=[rc(col:end) (d(col:end,2)-omega_inf)./delta_f(end)];
q1=[rc(col:end) (d(col:end,3)-omega_inf)./delta_f(end)];
p=polyfit(q(:,1),q(:,2),1);
p1=polyfit(q1(:,1),q1(:,2),1);
y=polyval(p,q(:,1));
y1=polyval(p1,q1(:,1));
disp('Nonisochronicity of oscillator 1')
nonis1=p(1)
disp('Nonisochronicity of oscillator 2')
nonis2=p1(1)

deta_non=nonis1-nonis2



g=plot(rc(1:end),(d(1:end,2)-omega_inf)/delta_f(end),'o-k',rc(1:end) ,(d(1:end,3)-omega_inf)/delta_f(end),'o-k');
xlim([-0.4 14]);ylim([-0.7 1.4])
xlabel('\itK\rm_r')
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)

h=subplot(2,2,3);

set(h,'fontsize',22,'FontName','Arial')

[ind]=find(rf>0.01);

rf1=rf(ind);
rc1=rc(ind);
rc1=rc1(1:end).^2;rf1=rf1(1:end).^2;
p=polyfit(rc1,rf1,1);
y=polyval(p,rc1);

g=plot(rc1,rf1,'ok',rc1,y,'k--');
xlim([-1.5 54]);ylim([0 1.2])
ylabel('(\Delta\omega/\Delta\omega_o)^2')
xlabel('\itK\rm^2\rm_r')
set(g(1),'markerfacecolor','k','markersize',10)
set(g(2),'Linewidth',2.5)


print -r300 -dtiff fig3.tiff

end


