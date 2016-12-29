
function figure9


fc=16;

d=load('Ae072310.dat'); % 1mm:1mm 
fc=16;
area=pi*0.05^2;
delta_f=d(:,2)-d(:,3);% fast oscillator come first
rf=delta_f./d(:,4);
rc=1./(area*d(:,1).*d(:,4));


h=subplot(2,2,1);

set(h,'fontsize',fc,'FontName','Arial')

g=plot(rc,rf,'-ok');
xlim([-30 850]);ylim([-0.05 1.15])
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('\itK\rm_r (s/cm^2k\Omega)')
set(g(1),'markerfacecolor','k','Linewidth',2)
hold all
%-----------------------------------------------------------------------------
% [rc,rf]=figure6;% 1.6mm:1.6mm
% 
% h=subplot(2,2,1);
% 
% set(h,'fontsize',fc,'FontName','Arial')
% 
% g=plot(rc,rf,'-^k');
% %xlim([-20 470]);ylim([-0.03 1.05])
% ylabel('\Delta\omega/\Delta\omega_o')
% xlabel('\itK\rm_r (s/cm^2k\Omega)')
% set(g(1),'markerfacecolor','k','Linewidth',2)

number=[28 29];

for k=1:length(number)
    
filename=strcat('Ae07',num2str(number(k)),'10.dat');    
[rc,rf,d]=fig8a1(filename,k);

h=subplot(2,2,1);

set(h,'fontsize',fc,'FontName','Arial')
g(k)=plot(rc,rf,'^k');
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('\itK\rm_r (s/cm^2k\Omega)')

switch k
    case 1
set(g(1),'markerfacecolor','w','Linestyle','-','Linewidth',2)%1.6 mm oscillator in high frequency, (1.6:1mm)
    case 2
set(g(2),'markerfacecolor','w','Linestyle','--','Linewidth',2)%1.6 mm oscillator in low frequency  (1:1.6mm)

end


number1=[225 301];
    
filename=strcat('Am0',num2str(number1(k)),'11.dat');
[rc,rf,d]=fig8b1(filename,k);


subplot(2,2,1)
g(k)=plot(rc,rf,'dik');

switch k
    case 1
set(g(1),'markerfacecolor','w','Linestyle','-','Linewidth',2) %2 mm oscillator in high frequency
    case 2
set(g(2),'markerfacecolor','w','Linestyle','--','Linewidth',2)%2 mm oscillator in low frequency

end


end
print -r300 -dtiff fig9.tiff

end