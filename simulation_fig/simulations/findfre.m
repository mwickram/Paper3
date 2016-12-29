function Fre=findfre(filename,dar,enum);

data1=load(filename);

for k=1:enum
    
data = data1(1:end,k);
data=hilbert(data-mean(data));
data=data(1000:end-1000);
datah(:,k)=data;
data=unwrap(angle(data));
t=[0:length(data)-1]'/dar;

p=polyfit(t,data,1);
fit=polyval(p,t);   

Frequency=p(1)/(2*pi); 
Fre(1,k)=Frequency;

end

Fre_diff=1000*abs(diff(Fre));

subplot(2,2,1:2)
data=data1(100:end-100,:);
t=[0:length(data)-1]'/dar;
plot(t,data(:,1),'-r',t,data(:,2),'-k')
xlim([200 400])

subplot(2,2,3)
plot(datah(:,1:2));

fout=strcat(dat,'_','.tiff');
print('-dtiff','-r300', fout);
close;


 end


 
 
 
 
 


