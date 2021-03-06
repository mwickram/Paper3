
function figure4

d=load('Bm031111.dat');% 1:2.56 ratio, large oscillator is high frequency

alpha=2.56;
area2=1;
r_area=area2*alpha/(1+alpha);


delta_f=d(:,2)-d(:,3) % fast osicllator first; Big oscillator is fast
rf=delta_f/delta_f(end);
rc=1./(2*r_area*d(:,1)*delta_f(end));
data1=[d(:,1) rc rf]


fc=14;

h=subplot(2,2,1);
set(h,'fontsize',fc,'FontName','Arial')

g=plot(rc,rf,'-ok');
ylabel('\Delta\omega/\Delta\omega_o')
xlim([-0.3 7]);ylim([-0.03 1.05])
set(g(1),'markerfacecolor','k','Linewidth',2)


h=subplot(2,2,2);

set(h,'fontsize',fc,'FontName','Arial')
omega_inf=mean(d(end,2:3));
g=plot(rc(1:end),(d(1:end,2)-omega_inf)/delta_f(end),'^-k',rc(1:end) ,(d(1:end,3)-omega_inf)/delta_f(end),'o-k');
xlim([-0.3 7]);ylim([-0.55 0.85])
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markersize',10,'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)


%Large electrode low frequency

d=load('Am031511.dat');

delta_f=d(:,3)-d(:,2) % fast oscillator is small one
rf=delta_f/delta_f(end);
rc=1./(2*r_area*d(:,1)*delta_f(end));
data2=[d(:,1) rc rf]

h=subplot(2,2,3);

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok');
ylabel('\Delta\omega/\Delta\omega_o')
xlim([-0.7 20]);ylim([-0.04 1.41])
set(g(1),'markerfacecolor','k','Linewidth',2)
set(h,'fontsize',fc,'FontName','Arial')


h=subplot(2,2,4);

set(h,'fontsize',fc,'FontName','Arial')
omega_inf=mean(d(end,2:3));
g=plot(rc(1:end),(d(1:end,2)-omega_inf)/delta_f(end),'^-k',rc(1:end) ,(d(1:end,3)-omega_inf)/delta_f(end),'o-k');
xlim([-0.7 20]);ylim([-0.6 1.5])
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markersize',10,'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)


print -r300 -dtiff fig4.tiff

end



