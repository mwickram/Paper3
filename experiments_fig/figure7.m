
function [rc,rf]=figure7

% 1 mm: 1mm electrodes

filename=['Ae072310.dat'];

d=load(filename);
fc=16;
area=pi*0.05^2;
delta_f=d(:,2)-d(:,3);% fast oscillator come first
rf=delta_f./d(:,4);
rc=1./(area*d(:,1).*d(:,4));

disp('1:1 electrodes')
data=[d(:,1) rc rf]  

figure(1)

col=10;
q=[rc(col:end) rf(col:end)];
p=polyfit(q(:,1),q(:,2),1);
y=polyval(p,q(:,1));
delata_nonis=mean(d(11:end,4)*p(1))


h=subplot(2,2,1);

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok',q(:,1),y,'r-');
xlim([-50 750]);ylim([-0.03 1.05])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('\itK\rm_r (s/cm^2k\Omega)')
set(g(1),'markerfacecolor','k','Linewidth',2)


h=subplot(2,2,2);

q=[rc(col:end) (d(col:end,2)-d(col:end,5))./d(col:end,4)];
q1=[rc(col:end) (d(col:end,3)-d(col:end,5))./d(col:end,4)];
p=polyfit(q(:,1),q(:,2),1);
p1=polyfit(q1(:,1),q1(:,2),1);
y=polyval(p,q(:,1));
y1=polyval(p1,q1(:,1));

%nonis1=mean(d(11:end,4))*p(1)
%nonis2=mean(d(11:end,4))*p1(1)

nonis1=p(1)
nonis2=p1(1)

deta_non=nonis1-nonis2


set(h,'fontsize',fc,'FontName','Arial')

g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'o-k',rc,(d(:,3)-d(:,5))./d(:,4),'o-k');
xlabel('\itK\rm_r (s/cm^2k\Omega)')
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)
xlim([-50 750]);ylim([-0.7 0.6])


%1.6 mm-1.6mm electrodes

filename=['Am021811.dat'];

d=load(filename);
area=pi*0.08^2;
d(end,5)=mean(d(end,2:3));%set by definition
d(end,4)=d(end,2)- d(end,3);%set by definition

delta_f=d(:,2)-d(:,3);% fast oscillator come first
rf=delta_f./d(:,4);
rc=1./(area*d(:,1).*d(:,4));

disp('1.6:1.6 electrodes')
data=[d(:,1) rc rf]  

h=subplot(2,2,3);

col=12;
q=[rc(col:end) rf(col:end)];
p=polyfit(q(:,1),q(:,2),1);
y=polyval(p,q(:,1));
delata_nonis=mean(d(13:end,4)*p(1))

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok',q(:,1),y,'r-');
xlim([-20 470]);ylim([-0.03 1.05])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('\itK\rm_r (s/cm^2k\Omega)')
set(g(1),'markerfacecolor','k','Linewidth',2)


h=subplot(2,2,4);
set(h,'fontsize',fc,'FontName','Arial')

q=[rc(col:end) (d(col:end,2)-d(col:end,5))./d(col:end,4)];
q1=[rc(col:end) (d(col:end,3)-d(col:end,5))./d(col:end,4)];
p=polyfit(q(:,1),q(:,2),1);
p1=polyfit(q1(:,1),q1(:,2),1);
y=polyval(p,q(:,1));
y1=polyval(p1,q1(:,1));
%nonis1=mean(d(13:end,4)*p(1))
%nonis2=mean(d(13:end,4)*p1(1))
nonis1=p(1)
nonis2=p1(1)


deta_non=nonis1-nonis2

g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'^-k',rc,(d(:,3)-d(:,5))./d(:,4),'^-k');
xlabel('\itK\rm_r (s/cm^2k\Omega)')
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)
xlim([-20 470]);ylim([-0.65 0.6])

print -r300 -dtiff fig6.tiff


figure7ex

end





