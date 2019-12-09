%SCRIPT PER GENERARE LA MATRICE MASTER COPY DELLE CARATTERISTICHE CON SOLO
%LE MEDIE


%Creo la matrice MasterCopy con le Features questa volta disposte per righe
%visto che la dovro' passare alla sequentialfs 

numFeatures=1; %Prendo solo la media degli intervalli
numInterval=15;

masterCopyFeatures=zeros(numInterval*2,size(masterCopy,2));

for i=1:size(masterCopy,2)
   masterFeatures=reduceVectorByMean(masterCopy(1:421,i),numInterval);
   copyFeatures=reduceVectorByMean(masterCopy(422:842,i),numInterval);
   
   masterCopyFeatures(1:numFeatures*numInterval,i)=masterFeatures';
   masterCopyFeatures(numFeatures*numInterval+1:2*numFeatures*numInterval,i)=copyFeatures';
   
end

clear numFeatures numInterval i masterFeatures masterMatrix

%masterCopyFeatures=zscore(masterCopyFeatures); %normalizzo

%%%%%%  FUNZIONE PER PRODURRE IL VETTORE DELLE CARATTERISTICHE  %%%%%%%%%%%

%QUESTA FUNZIONE PRENDE UN VETTORE V ED UN NUMERO DI INTERVALLI N COME
%ARGOMENTI. DIVIDE IN VETTORE IN N INTERVALLI E PER OGNI INTERVALLO CALCOLA
%LA MEDIA. IL VETTORE RISULTANTE AVRA'UNA DIMENSIONE PARI AD N CIOÈ LA
%MEDIA


function aggregatedVector = reduceVectorByMean(vector,numIntervals)

numFeatures=1; %il numero di caratteristiche e' 1 cioé la media
aggregatedVector=zeros(1,numIntervals*numFeatures);
size=length(vector);

intervalSize=round(size/numIntervals);

    for i=1:numIntervals   

        indexVector=(i-1)*(intervalSize)+1;
        indexAggVector=(i-1)*(numFeatures)+1;

        if (i==numIntervals)
        %se e' l'ultimo intervallo devo prendere anche i valori finali
        aggregatedVector(indexAggVector)=mean(vector(indexVector:length(vector))); %mean
        else           
        aggregatedVector(indexAggVector)=mean(vector(indexVector:indexVector+(intervalSize-1))); %mean
        end
    end 
      

end

