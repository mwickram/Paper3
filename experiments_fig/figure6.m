function figure6

number=[10 11];

dar=200;
fc=16;
V=1.180;

for k=1:length(number)
    
fname=strcat('m021811_',num2str(number(k)),'.dat');

d=load(fname);   
d=sgolayfilt(d,2,21);
t=[0:length(d(:,1))-1]'/dar;
      
V1=mean(V-d(:,1))
I1=mean(d(:,1))/0.385
V2=mean(V-d(:,2))
I2=mean(d(:,2))/0.420

h=subplot(2,2,k);  

set(h,'fontsize',fc,'FontName','arial')
g=plot(t,V-d(:,1),'-k',t,V-d(:,2),'--k');

xlim([36 51])
ylim([0.83 1.07])

set(g(1),'Linewidth',2)
set(g(2),'Linewidth',2)
xlabel('\itt\rm (s)')
ylabel('\itV-iR\rm_i_n_d (V)')

for k1=1:2
    
d1=d(:,k1);
d1=d1-mean(d1);
d1=hilbert(d1);
phs(:,k1)=unwrap(angle(d1(100:end-100)));

end

difp=phs(:,1)-phs(:,2);
disp('mean phase difference')
mean(difp)
t1=[0:length(difp)-1]/dar;
t1=t1';


h=subplot(2,2,k+2);
set(h,'fontsize',fc,'FontName','arial')
g=plot(t1,difp,'-k');
set(g(1),'Linewidth',2)
xlabel('\itt\rm (s)')
ylabel('\Delta\phi (rad)')
xlim([0 75])
ylim([0 17])



print -r300 -dtiff fig6.tiff


end
