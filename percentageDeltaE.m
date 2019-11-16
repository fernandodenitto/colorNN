%SCRIPT DA CANCELLARE CHE CALCOLA LE PERCENTUALI DI DELTA_E

function bin=checkBucketdeltaE(deltaEvector)
    
    percVector=zeros(1,5);

    for i=1:length(deltaEvector)

     if (deltaEvector(i)>0)&&(deltaEvector(i)<1)
        percVector(1)=percVector(1)+1;
     end
     if (deltaEvector(i)>=1)&&(deltaEvector(i)<2)
        percVector(2)=percVector(2)+1;
     end
     if (deltaEvector(i)>=2)&&(deltaEvector(i)<3.5)
        percVector(3)=percVector(4)+1;
     end
     if (deltaEvector(i)>=3.5)&&(deltaEvector(i)<=5)
        percVector(4)=percVector(4)+1;
     end
     if (deltaEvector(i)>=5)
        percVector(5)=percVector(5)+1;
     end
     
    end
     
     bin=percVector/length(deltaEvector);
end