function figure5

 
alpha=[1 2.56 4];area2=1;
r_area=area2.*alpha./(1+alpha);


d=load('Am031111.dat');  % 1:1 ratio
delta_f=d(:,2)-d(:,3);
rf=delta_f/delta_f(end);
rc=1./(2*r_area(1)*d(:,1)*delta_f(end));

fc=16;

h=subplot(2,2,1);

set(h,'fontsize',fc,'FontName','Arial')
g=plot(rc,rf,'-ok');
ylabel('\Delta\omega/\Delta\omega_o')
xlabel('\itK\rm_r')
set(g(1),'markerfacecolor','k','Linewidth',2)
xlim([-0.6 20]);
ylim([-0.05 1.61])
hold all

%--------------------------------------------------------------------------
%--------------------


d=load('Bm031111.dat');% 1:2.56 ratio, large oscillator is high frequency


delta_f=d(:,2)-d(:,3);
rf=delta_f/delta_f(end);
rc=1./(2*r_area(2)*d(:,1)*delta_f(end));

g=plot(rc,rf,'-^k');
set(g(1),'markerfacecolor','w','Linewidth',2)

%--------------------------------------------------------------------------
%-----

d=load('Am031511.dat');%1:2.56 ratio, large oscillator is low frequency

delta_f=d(:,3)-d(:,2);
rf=delta_f/delta_f(end);
rc=1./(2*r_area(2)*d(:,1)*delta_f(end));


g=plot(rc,rf,'--^k');
set(g(1),'markerfacecolor','w','Linewidth',2)



%--------------------------------------------------------------------------
%--------

d=load('Cm031111.dat'); % 1:4 ratio, large oscillator is high frequency

delta_f=d(:,2)-d(:,3);
rf=delta_f/delta_f(end);
rc=1./(2*r_area(3)*d(:,1)*delta_f(end));

g=plot(rc,rf,'di-k');
set(g(1),'markerfacecolor','w','Linewidth',2)


%--------------------------------------------------------------------------
%-------

d=load('Bm031511.dat'); % 1:4 ratio, large oscillator is low frequency

delta_f=d(:,3)-d(:,2);
rf=delta_f/delta_f(end);
rc=1./(2*r_area(3)*d(:,1)*delta_f(end));

g=plot(rc,rf,'di--k');
set(g(1),'markerfacecolor','w','Linewidth',2)

print -r300 -dtiff fig5.tiff

end

