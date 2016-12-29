 function [zigma]=phase_diff(dat,dar,enum,cor,corl,re,im)


dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');

sdir=dat(1:7);
Data=strcat(dn,sdir,'\',dat);
data1=load(Data);
%data1= [data1(:,2) data1(:,1) data1(:,3)] 

for k=1:enum % enum= Number of electrodes
data=data1(1:end,k);

% for m090508_ based files
d=sgolayfilt(data,2,21);
d=d-mean(d);

h=hilbert(d);%for simple Oscillations and phase coherent chaos
h=dar*diff(hilbert(d));
h=h + re + im*(i);%used for rossler model and haim model
h=sgolayfilt(h,2,21);

%select=input('Hilbert selection 1/0=');
%if select==1
%h=h-3e-3-1e-3*i;
%end

%h=h+ 0.0001-i*0.0005;
p(:,k)=unwrap(angle(h(cor:end-corl)));

end


t=(1:length(p(:,1)))/dar;

pdd=p(:,1)-p(:,2);

disp(['Phase Difference','  ', num2str(mean(pdd))])


A=subplot(3,2,1);
plot(t,pdd);

ylabel('Phase difference, rad');
xlabel('t, s'); 
title([dat(1:7) dat(9:13) '  '  'E1-E2' ])

B=subplot(3,2,2);

pdd2=mod(pdd,2*pi);
nbox=[0:0.1:2*pi];
[ny,nx]=hist(pdd2,nbox);
pr=ny/length(pdd2);
bar(nx,pr);
ind=find(pr==0);
%size(ind)
pr(ind)=[];
%size(pr)
S=-sum(pr.*log(pr));
Smax=log(length(nbox));

sigma1_2=1-S/Smax% Extent of Sycronization


xlabel('mod(\Delta\oslash,2\pi)');
ylabel('Probability');
title(['\sigma'  '  '   '='  '  '  num2str(sigma1_2)]) ;

zigma=sigma1_2;

if enum==3

pdd1=p(:,3)-p(:,2);

B=subplot(3,2,3);
plot(t,pdd1)

ylabel('Phase difference, rad');
xlabel('t, s');
title('E2-E3');

%get(B,'position')
%set(B,'position',[0.5762 0.2687 0.3389 0.437]);
%ylabel('\phi, (rad)');
%xlabel('t, s');
%axes2 = axes('Parent',figure1,'Position',[0.5762 0.2687 0.3389 0.437]);


subplot(3,2,4);
pdd3=mod(pdd1,2*pi);
nbox=[0:0.1:2*pi];
[ny,nx]=hist(pdd3,nbox);
pr1=ny/length(pdd3);
bar(nx,pr1);
ind1=find(pr1==0);
pr1(ind1)=[];
S1=-sum(pr1.*log(pr1));
Smax1=log(length(nbox));

sigma2_3=1-S1/Smax1

xlabel('mod(\Delta\oslash,2\pi)')
ylabel('Probability')
title(['\sigma'  '  '  '='  '  '  num2str(sigma2_3)]) 


pdd4=p(:,3)-p(:,1);

subplot(3,2,5)
plot(t,pdd4)
ylabel('Phase difference, rad');

xlabel('t, s');
title('E3-E1');

subplot(3,2,6)
pdd5=mod(pdd4,2*pi);
nbox=[0:0.1:2*pi];
[ny,nx]=hist(pdd5,nbox);
pr2=ny/length(pdd5);
bar(nx,pr2);
ind2=find(pr2==0);
pr2(ind2)=[];
S2=-sum(pr2.*log(pr2));
Smax2=log(length(nbox));

sigma1_3=1-S2/Smax2

xlabel('mod(\Delta\oslash,2\pi)')
ylabel('Probability')
title(['\sigma'  '  '  '='  '  '  num2str(sigma1_3)]) 



print -dtiff -r300 slide.tiff


%phase_diffence=[pdd pdd1 pdd4];

zigma=[sigma1_2 sigma2_3 sigma1_3];

end




