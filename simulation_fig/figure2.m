

function figure2

number=[13 4];

dar=10;
fc=16;

for k=1:length(number)
    
fname=strcat('m031111_',num2str(number(k)),'.dat')

d=load(fname);
t=[0:length(d(:,1))-1]'/dar;

h=subplot(2,2,k);  

set(h,'fontsize',fc,'FontName','arial')
g=plot(t,d(:,1),'-k',t,d(:,2),'--k');
xlabel('\itt')
ylabel('\ite')
xlim([400 550])
ylim([-7 -1])
%set(gca,'xtick',[50:20:150])
ylim([-7 0])
set(g(1),'Linewidth',2)
set(g(2),'Linewidth',2)


for k1=1:2
    
d1=d(:,k1);
d1=d1-mean(d1);
d1=hilbert(d1);
phs(:,k1)=unwrap(angle(d1(1000:end-1000)));

end

difp=phs(:,1)-phs(:,2);
mean(difp)
t1=[0:length(difp)-1]/dar;
t1=t1';


h=subplot(2,2,k+2);
set(h,'fontsize',fc,'FontName','arial')
g=plot(t1,difp,'-k');
set(g(1),'Linewidth',2)
xlabel('\itt')
ylabel('\Delta\phi')
xlim([0 8000])
ylim([-5 50])

end

print -r300 -dtiff fig2.tiff

end


