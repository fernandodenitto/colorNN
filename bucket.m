deltaBucket=zeros(1,5);

for i=1:size(deltaE,2)
   if(deltaE(i)<1)
       deltaBucket(1)=deltaBucket(1)+1;
   end
   if(deltaE(i)>=1 && deltaE(i)<2)
       deltaBucket(2)=deltaBucket(2)+1;
   end
   if(deltaE(i)>=2 && deltaE(i)<3.5)
       deltaBucket(3)=deltaBucket(3)+1;
   end
   if(deltaE(i)>=3.5 && deltaE(i)<5)
       deltaBucket(4)=deltaBucket(4)+1;
   end
   if(deltaE(i)>=5)
       deltaBucket(5)=deltaBucket(5)+1;
   end
   
end