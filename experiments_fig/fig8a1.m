
function [rc,rf,d]=fig8a1(filename,k);

d=load(filename);

a1=pi*0.08^2;
a2=pi*0.05^2;
r_area=a1*a2/(a1+a2);


switch k
    case 1 
    %Large electrode in 2nd column
    
    delta_f=d(:,2)-d(:,3);
    
    case 2
    %Large electrode in 2nd column'
    d(end,5)=mean(d(end,2:3));%set by definition
    d(end,4)=abs(diff(d(end,2:3)));%set by definition
    delta_f=d(:,3)-d(:,2);
   
end

rf=delta_f./d(:,4);
rc=1./(2*r_area*d(:,1).*d(:,4));
    
if k==2
    d1=[rc rf d];
    d1=sortrows(d1,-1);
    rc=d1(:,1);
    rf=d1(:,2);
    d=d1(:,3:end);% uncoupled in the first row
    
end


end


