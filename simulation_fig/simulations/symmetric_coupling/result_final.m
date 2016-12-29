
function result_final(filename,alpha,area2)

d=load(filename);

r_area=area2*alpha/(1+alpha);

delta_f=d(:,2)-d(:,3);% fast oscillator come first
rf=delta_f/abs(delta_f(end));
rc=1./(2*r_area*d(:,1)*delta_f(end));
data=[d(:,1) rc rf]


fc=14;

h=subplot(2,2,1);

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok');
xlim([0 14]);ylim([0 1.1])
ylabel('\Delta\omega/\mid\Delta\omega_o\mid')
xlabel('\itK\rm_r')
set(g(1),'markerfacecolor','k','Linewidth',2)
title(filename)

subplot(2,2,2)

[ind]=find(rf>0.01);

rf1=rf(ind);
rc1=rc(ind);
rc1=rc1(1:end).^2;rf1=rf1(1:end).^2;
p=polyfit(rc1,rf1,1);
y=polyval(p,rc1);

plot(rc1,rf1,'-o',rc1,y,'k-')
slope=p(1);
title(['slope =', ' ', num2str(p(1))])
xlim([0 60]);ylim([0.2 1])
ylabel('[\Delta\omega/\Delta\omega_o]^2')
xlabel('K_r^2')

subplot(2,2,3)
plot(rc,1000*delta_f,'-o')
xlim([0 14]);ylim([0 1.2])
ylabel('\Delta\omega\times10^-^3')
xlabel('K_r^2')


subplot(2,2,4)
omega_inf=mean(d(end,2:3));
plot(rc(1:end),(d(1:end,3)-omega_inf)/abs(delta_f(end)),'o-',rc(1:end) ,(d(1:end,2)-omega_inf)/abs(delta_f(end)),'^-')
xlim([0 14]);ylim([-1 2])
xlabel('K_r')
ylabel('\omega-\omega_o/\mid\Delta\omega_o\mid')

end


