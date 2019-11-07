%SCRIPT PER GENERARE LA BONTA DELLE INTERPOLAZIONI
%Lo script interpola ogni singolo spettro di colore master con lo stesso
%suddivisi con lo stesso numero di intervalli e calcola per ognuno l'errore
%quadratico medio. Infine fa la media degli errori per capire l'ordine di
%grandezza in cui ci troviamo. Come risultato avremo una matrice che ci
%fornisce per ogni numero di intervalli scelto la media degli errori
%quadratici medi.

rangeIntervals=7:20; 
matrix=spectraReducted;
results=zeros((size(matrix,1)+1),size(matrix,2));

for j=1:length(rangeIntervals)
    
    results(j,1)=rangeIntervals(j);
    xAxisAgg=xAxisAggregate(wavelength,rangeIntervals(j));
    
    for i=1:size(spectraReducted,2)
        
        aggregatedSpectra=reduceVectorByMean(spectraReducted(:,i),rangeIntervals(j));
        interpolatedSpectra=interp1(xAxisAgg,aggregatedSpectra,wavelength,'pchip');
        results(j,i+1)=immse(interpolatedSpectra,spectraReducted(:,i)'); 
    end
    
end


function aggregatedVector = reduceVectorByMean(vector,numIntervals)

aggregatedVector=zeros(1,numIntervals);
size=length(vector);

intervalSize=round(size/numIntervals);

    for i=1:numIntervals        
        if (i==numIntervals)
        %se e' l'ultimo intervallo devo prendere anche i valori finali
        indexVector=(i-1)*(intervalSize)+1;
        aggregatedVector(i)=mean(vector(indexVector:length(vector)));                
        else           
        indexVector=(i-1)*(intervalSize)+1;
        aggregatedVector(i)=mean(vector(indexVector:indexVector+(intervalSize-1)));        
        end
    end
end

% FUNZIONE CHE RESTITUISCE I VALORI DI X PER CUI TRACCIARE I GRAFICI DELLE
% CARATTERISTICHE AGGREGATE. VIENE USATO IN plotAggregsateFeatures.mi

function xAgg = xAxisAggregate(wavelength,numIntervals)

xAgg=zeros(1,numIntervals);
intervalSize=round(length(wavelength)/numIntervals);


for i=1:numIntervals
    xAgg(i)=mean(wavelength((i-1)*(intervalSize)+1):wavelength((i)*((intervalSize))));
end

end



