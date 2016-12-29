function batchplot


%basename='p100120_';
%Krun=[0:0.002:0.02];

%Krun=[0:0.001:0.01];
%basename='p100120a_';

%Krun=[0:0.001:0.01];
%basename='p100120b_';

%Krun=[0.005:0.0003:0.0085];
%basename='p100120c_';

%Krun=[0:0.001:0.015];
%basename='p022311a_';
Krun=[0:0.001:0.015];
basename='p022311b_';

for k=1:length(Krun)
    filename=strcat(basename,num2str(k),'.mat')
    load(filename);
    Kplot=K;
    fplot(k,1)=ff(1);
    fplot(k,2)=ff(2);
    fplot(k,3)=ff(2)-ff(1);
end

subplot(2,2,1);
hold on;
plot(Krun,fplot(:,1:2),'o-');
xlabel('K');
ylabel('f');

subplot(2,2,2);
hold on;
plot(Krun,fplot(:,3),'o-');
xlabel('K');
ylabel('\Delta f');
print -dtiff -r300 p.tiff;