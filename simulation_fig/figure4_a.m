
function figure4_a

d=load('Cm031111.dat');

alpha=4;
area2=1;
r_area=area2*alpha/(1+alpha);


delta_f=d(:,2)-d(:,3)
rf=delta_f/delta_f(end);
rc=1./(2*r_area*d(:,1)*delta_f(end));
data1=[d(:,1) rc rf]


fc=16;

h=subplot(2,2,1);
set(h,'fontsize',fc,'FontName','Arial')

g=plot(rc,rf,'-ok');
ylabel('\Delta\omega/\Delta\omega_o')
xlim([-0.3 7]);ylim([-0.03 1.05])
set(g(1),'markerfacecolor','k','Linewidth',2)


h=subplot(2,2,2);

set(h,'fontsize',fc,'FontName','Arial')
omega_inf=mean(d(end,2:3));
g=plot(rc(1:end),(d(1:end,2)-omega_inf)/delta_f(end),'di-k',rc(1:end) ,(d(1:end,3)-omega_inf)/delta_f(end),'o-k');
xlim([-0.3 7]);ylim([-0.55 0.75])
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markersize',10,'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)


%Large electrode low frequency

d=load('Bm031511.dat');

delta_f=d(:,3)-d(:,2) % faster oscillator first
rf=delta_f/delta_f(end);
rc=1./(2*r_area*d(:,1)*delta_f(end));
data2=[d(:,1) rc rf]


h=subplot(2,2,3);

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok');
xlabel('\itK\rm_r')
ylabel('\Delta\omega/\Delta\omega_o')
xlim([-0.7 21]);ylim([-0.04 1.61])
set(g(1),'markerfacecolor','k','Linewidth',2)
set(h,'fontsize',fc,'FontName','Arial')


h=subplot(2,2,4);

set(h,'fontsize',fc,'FontName','Arial')

omega_inf=mean(d(end,2:3));
g=plot(rc(1:end),(d(1:end,2)-omega_inf)/delta_f(end),'di-k',rc(1:end) ,(d(1:end,3)-omega_inf)/delta_f(end),'o-k');
xlim([-0.7 21]);ylim([-0.6 1.5])
xlabel('\itK\rm_r')
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markersize',10,'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)


print -r300 -dtiff fig4a.tiff

end

    

