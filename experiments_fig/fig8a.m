function fig8a

disp('1 mm and 1.6 mm') 

number=[28 29];

for k=1:length(number)
    
filename=strcat('Ae07',num2str(number(k)),'10.dat');    
    
[rc,rf,d]=fig8a1(filename,k);


figure(81)
fc=16;

h=subplot(2,2,2*k-1);

set(h,'fontsize',fc,'FontName','Arial')

g=plot(rc,rf,'-ok');
xlim([-20 540]);ylim([-0.04 1.1])
ylabel('\Delta\omega/\Delta\omega_o')
%xlabel('\itK\rm_r (s/cm^2k\Omega)')
set(g(1),'markerfacecolor','k','Linewidth',2)


h=subplot(2,2,2*k);

set(h,'fontsize',fc,'FontName','Arial')


g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'^-k',rc,(d(:,3)-d(:,5))./d(:,4),'o-k');
xlim([-20 540]);
ylim([-0.68 0.58]);
%xlabel('\itK\rm_r (s/cm^2k\Omega)')
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markersize',10,'markerfacecolor','w','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)


subplot(2,2,3)
xlim([-10 285]);
ylim([-0.04 1.1]);

subplot(2,2,4)
xlim([-10 285]);

data=[d(:,1) rc rf] 

end

print -r300 -dtiff fig8a.tiff

end