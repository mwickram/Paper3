function [rc,rf,d]=fig8b1(filename,k);

disp('1mm and 2 mm electrodes')
d=load(filename);

a1=pi*0.1^2;
a2=pi*0.05^2;
r_area=a1*a2/(a1+a2);


switch k
    case 1 
    %Large electrode in 3nd column
    
    d(end,5)=mean(d(end,2:3));%set by definition
    d(end,4)=abs(diff(d(end,2:3)));%set by definition

    delta_f=d(:,3)-d(:,2);
    case 2
    %Large electrode in 3nd column
    delta_f=d(:,2)-d(:,3);
   
end

rf=delta_f./d(:,4);
rc=1./(2*r_area*d(:,1).*d(:,4));
    


end