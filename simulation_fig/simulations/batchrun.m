function batchrun(base,Rc,nl);

      
 
for k=1:length(Rc)
  
    filename=strcat(base,'_',num2str(k),'.dat');
    fname(k)={filename};
      
    c=findfre(filename,10,2); %findfre(d,rate,enum)
    data(k,1)=Rc(k);
    data(k,2:3)=c;
    fname1(k,1)={filename};
         
end


outp=strcat(nl,base,'.dat');
save ('-ascii',outp,'data');
filename=char(fname1)   

end

  

