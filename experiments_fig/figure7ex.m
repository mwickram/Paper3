
function figure7ex

filename=['Ae072310.dat'];

d=load(filename);
area=pi*0.05^2;
delta_f=d(:,2)-d(:,3);% fast oscillator come first
rf=delta_f./d(:,4);
rc=1./(area*d(:,1).*d(:,4));

figure(2)

h=subplot(2,2,1);
set(h,'fontsize',22,'FontName','Arial')

[ind]=find(rf>0.015);
rc1=rc(ind).^2;rf1=rf(ind).^2;
p=polyfit(rc1,rf1,1);
y=polyval(p,rc1);

g=plot(rc1/1000,rf1,'ok',rc1/1000,y,'k--');
xlim([-3 75]);ylim([-0.1 1.1])
ylabel('(\Delta\omega/\Delta\omega_o)^2')
xlabel('10^3\times\itK^2\rm_r (s^2/cm^4k\Omega^2)')
set(g(1),'markerfacecolor','k')
set(g(2),'markerfacecolor','k','Linewidth',2)


%1.6 mm-1.6mm electrodes

filename=['Am021811.dat'];

d=load(filename);
area=pi*0.08^2;
d(end,5)=mean(d(end,2:3));%set by definition
d(end,4)=d(end,2)- d(end,3);%set by definition

delta_f=d(:,2)-d(:,3);% fast oscillator come first
rf=delta_f./d(:,4);
rc=1./(area*d(:,1).*d(:,4));


h=subplot(2,2,2);
set(h,'fontsize',22,'FontName','Arial')

[ind]=find(rf>0.015);
rc1=rc(ind).^2;rf1=rf(ind).^2;
p=polyfit(rc1,rf1,1);
y=polyval(p,rc1);

g=plot(rc1/1000,rf1,'ok',rc1/1000,y,'k--');
xlim([-2 65]);ylim([-0.1 1.1])
ylabel('(\Delta\omega/\Delta\omega_o)^2')
xlabel('10^3\times\itK^2\rm_r (s^2/cm^4k\Omega^2)')
set(g(1),'markerfacecolor','k')
set(g(2),'markerfacecolor','k','Linewidth',2)


print -r300 -dtiff fig7ex.tiff

end


