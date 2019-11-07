%QUESTA FUNZIONE PRENDE UN VETTORE V ED UN NUMERO DI INTERVALLI N COME
%ARGOMENTI. DIVIDE IN VETTORE IN N INTERVALLI E PER OGNI INTERVALLO CALCOLA
%5 FEATURES COME COME SCELTO NELL'IMPLEMENTAZIONE: MEDIA,MEDIANA,MAX,MIN E
%VARIANZA. IL VETTORE RISULTANTE AVRA'UNA DIMENSIONE PARI AD N*5 CIOÈ PER
%RAGGRUPPATI A GRUPPI DI 5, CIOÉ LE FEATURES DELL'I-ESIMO INTERVALLO SI
%TROVANO A PARTIRE DALLA POSIZIONE I*5 FINO ALLA (I*5)+4

function aggregatedVector = reduceVectorByFeatures(vector,numIntervals)

numFeatures=5; %il numero di caratteristiche e' 5 come implementato da progetto
aggregatedVector=zeros(1,numIntervals*numFeatures);
size=length(vector);

intervalSize=round(size/numIntervals);

    for i=1:numIntervals   

        indexVector=(i-1)*(intervalSize)+1;
        indexAggVector=(i-1)*(numFeatures)+1;

        if (i==numIntervals)
        %se e' l'ultimo intervallo devo prendere anche i valori finali
        aggregatedVector(indexAggVector)=mean(vector(indexVector:length(vector))); %mean
        aggregatedVector(indexAggVector+1)=median(vector(indexVector:length(vector))); %median
        aggregatedVector(indexAggVector+2)=max(vector(indexVector:length(vector))); %max
        aggregatedVector(indexAggVector+3)=min(vector(indexVector:length(vector))); %min
        aggregatedVector(indexAggVector+4)=var(vector(indexVector:length(vector))); %variance
        %aggregatedVector(indexAggVector+5)=std(vector(indexVector:length(vector))); %standard deviation
        else           
        aggregatedVector(indexAggVector)=mean(vector(indexVector:indexVector+(intervalSize-1))); %mean
        aggregatedVector(indexAggVector+1)=median(vector(indexVector:indexVector+(intervalSize-1))); %median
        aggregatedVector(indexAggVector+2)=max(vector(indexVector:indexVector+(intervalSize-1))); %max
        aggregatedVector(indexAggVector+3)=min(vector(indexVector:indexVector+(intervalSize-1))); %min
        aggregatedVector(indexAggVector+4)=var(vector(indexVector:indexVector+(intervalSize-1))); %variance
        %aggregatedVector(indexAggVector+5)=std(vector(indexVector:indexVector+(intervalSize-1))); %standard deviation
        end
    end 
    
    %aggMatrix=reshape(aggregatedVector,[5,10]);
  

end

