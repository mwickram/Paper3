function Fre=findfre(dat,dar,enum)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');
sdir=dat(1:7);
D=strcat(dn,sdir,'\',dat);
data1=load(D);

data1=sgolayfilt(data1,2,21);

for k=1:enum
    
data = data1(1:end,k);
data=hilbert(data-mean(data));
datah=data(100:end-100);
datah(:,k)=dar*diff(datah);
%data=dar*diff(data);
data=data(100:end-100);
data=sgolayfilt(data,2,21);
data=unwrap(angle(data));
t=[0:length(data)-1]'/dar;

p= polyfit(t,data,1);
fit=polyval(p,t);  

Frequency=p(1)/(2*pi); 
Fre(1,k)=Frequency;

end

Fre_diff=1000*abs(diff(Fre))

subplot(2,2,1)
plot(datah(:,1:2))
title([dat(1:7),'\',dat(8:end)]);


fout=strcat(dat,'_','.tiff');
print('-dtiff','-r300', fout);
close;


 end


 
 
 
 
 


