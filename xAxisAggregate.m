% FUNZIONE CHE RESTITUISCE I VALORI DI X PER CUI TRACCIARE I GRAFICI DELLE
% CARATTERISTICHE AGGREGATE. VIENE USATO IN plotAggregsateFeatures.mi

function xAgg = xAxisAggregate (wavelength,numIntervals)

xAgg=zeros(1,numIntervals);
intervalSize=floor(length(wavelength)/numIntervals);


for i=1:numIntervals
    xAgg(i)=mean(wavelength((i-1)*(intervalSize)+1):wavelength((i)*((intervalSize))));
    
end

end