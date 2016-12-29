function Fre=findfre_exp(dat,dar,nf1,nf2,R)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');
sdir=dat(1:7);
D=strcat(dn,sdir,'\',dat);
data1=load(D);

%data1=data1(1:30000,:);
data1=sgolayfilt(data1,2,21);

for k=1:2
    
data = data1(1:end,k);
data=hilbert(data-mean(data));

data=dar*diff(data);


data=data(100:end-100);

datah(:,k)=data;

data=sgolayfilt(data,2,21);
data=unwrap(angle(data));
t=[0:length(data)-1]'/dar;

p= polyfit(t,data,1);
fit=polyval(p,t);  

Frequency=p(1)/(2*pi); 
Fre(1,k)=Frequency;

end


plot(datah)
grid;
%current=[mean(data1(:,1)) mean(data1(:,2))]
delta_f=1000*abs(diff(Fre))


a1=pi*0.05^2;
a2=pi*0.1^2;
r_area=a1*a2/(a1+a2);

nf=mean([nf1 nf2]);
rf=delta_f./nf
rc=1./(2*r_area*R*nf/1000)


 end


 
 
 
 
 


