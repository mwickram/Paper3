function freq=get_freq(data,dar)
data=data-mean(data);
t=[1:length(data)]'/dar;
h=hilbert(data);
%subplot(2,2,1);
%plot(t,data);
%xlabel('Time (s)');
%ylabel('Current (mA)');
%xlim([0,10]);
%subplot(2,2,2);
%plot(h);
p=unwrap(angle(h));
%subplot(2,2,3);
%plot(t,p);
m=polyfit(t,p,1);
freq=m(1)/2/pi;


