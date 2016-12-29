%
function result_final(filename,alpha,area2)

alpha=2.56; area2=1; 
filename=('Am031511.dat');


d=load(filename)

r_area=area2*alpha/(1+alpha);

delta_f=d(:,3)-d(:,2);
rf=delta_f/delta_f(end);
rc=1./(2*r_area*d(:,1)*delta_f(end));
data=[d(:,1) rc rf]

subplot(2,2,1)
plot(rc,rf,'-o')
%xlim([0 7]);ylim([0 1.1])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('K_r')
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
%xlim([0 7]);ylim([0 1.1])
ylabel('[\Delta\omega/\Delta\omega_o]^2')
xlabel('K_r^2')

subplot(2,2,3)
plot(rc,1000*delta_f,'-o')
%xlim([0 7]);ylim([0 1.2])
ylabel('\Delta\omega')
xlabel('K_r^2')


subplot(2,2,4)
omega_inf=mean(d(1,2:3));
(d(:,2:3)-omega_inf)/delta_f(end);
plot(rc(1:end),(d(1:end,2)-omega_inf)/delta_f(end),'o-',rc(1:end) ,(d(1:end,3)-omega_inf)/delta_f(end),'^-')
%xlim([0 7]);ylim([-1.2 0.25])
xlabel('K_r')
ylabel('\omega')

end


