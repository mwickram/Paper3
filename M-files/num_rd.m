function num_rd


R=[2 3 4 5 6 6.2 6.5 7 8 9 10 12 15 20 25 30 35 40 50];

nf=30;
a1=pi*0.05^2;
a2=pi*0.1^2;
r_area=a1*a2/(a1+a2);

k=1./(r_area*R*nf/1000);


kc=442;
k=1./(2*r_area*R*nf/1000);
wr=real(sqrt(1-k/kc));

frq_diff=abs(wr*nf);


subplot(2,2,1)
plot(k,wr,'-o')

subplot(2,2,2)
plot(R,wr,'-o')

subplot(2,2,3)
plot(R,frq_diff,'-o')

end