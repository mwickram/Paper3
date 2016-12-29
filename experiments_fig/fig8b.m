
function fig8b

disp('1 mm and 2 mm')

number=[225 301];

for k=1:length(number)

filename=strcat('Am0',num2str(number(k)),'11.dat');

[rc,rf,d]=fig8b1(filename,k);

h=subplot(2,2,2*k-1);
fc=16;

set(h,'fontsize',fc,'FontName','Arial')

g=plot(rc,rf,'-ok');
xlim([-30 840]);ylim([-0.04 1.12])
ylabel('\Delta\omega/\Delta\omega_o')
%xlabel('\itK\rm_r (s/cm^2k\Omega)')
set(g(1),'markerfacecolor','k','Linewidth',2)

h=subplot(2,2,2*k);


set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,(d(:,2)-d(:,5))./d(:,4),'o-k',rc,(d(:,3)-d(:,5))./d(:,4),'di-k');
xlim([-30 840]);
ylim([-0.68 0.62]);
%xlabel('\itK\rm_r (s/cm^2k\Omega)')
ylabel('(\omega-\omega_o)/\Delta\omega_o')
set(g(1),'markerfacecolor','k','Linewidth',2)
set(g(2),'markersize',10,'markerfacecolor','w','Linewidth',2)


subplot(2,2,3)
xlim([-20 360]);
ylim([-0.045 1.05]);
xlabel('\itK\rm_r (s/cm^2k\Omega)')

subplot(2,2,4)
xlim([-20 360]);
ylim([-0.58 0.53]);
xlabel('\itK\rm_r (s/cm^2k\Omega)')

data=[d(:,1) rc rf]  
end

print -r300 -dtiff fig8b.tiff

end