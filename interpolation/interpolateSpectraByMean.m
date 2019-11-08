%LA FUNZIONE PRENDE UNO SPETTRO E LO DIVIDE IN INTERVALLI CALCOLANDO PER
%OGNI INTERVALLO LA MEDIA. SUCCESSIVAMENTE EFFETTUA L'INTERPOLAZIONE DELLO
%SPETTRO OTTENUTO TRAMITE LE SUE MEDIE E CALCOLA LA BONTÀ
%DELL'INTERPOLAZIONE METTENDO A CONFRONTO LO SPETTRO ORIGINALE E QUELLO
%INTERPOLATO. IL RISULTATO È IL VALORE MSE DELL'INTERPOLAZIONE (LOWER IS
%BETTER) E SE SI IMPOSTRA IL VALORE DELL'ARGOMENTRO plot A TRUE GENERA IL
%PLOT DEI DUE SPETTRI

function interpMse=interpolateSpectraByMean(originalSpectra,wavelength,numIntervals,plot) 

    %CREO LE ASCISSE PER POTER CREARE LO SPETTRO INTERPOLATO ED
    %EVENTUALMENTE POTER GENERARE IL PLOT, IN PARTICOLARE LE MEDIE
    %DELL'INTERVALLO DEVONO COINCIDERE NELL'ASSE DELLE X CON IL VALORE
    %CENTRALE DELLE ASCISSE IN QUELL'INTERVALLO
    xAgg=xAxisAggregate(wavelength,numIntervals);
    
    aggregatedSpectra=reduceVectorByMean(originalSpectra,numIntervals);
    interpolatedSpectra=interp1(xAgg,aggregatedSpectra,wavelength,'pchip');
    
    interpMse=immse(interpolatedSpectra,originalSpectra'); 
    
    if plot
        plotInterpolation(originalSpectra,interpolatedSpectra,wavelength)
    end

end


%FUNZIONE PER CREARE IL VETTORE CONTENENTE LE MEDIE DEGLI INTERVALLI

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

%FUNZIONE PER ESEGUIRE IL PLOT DELLO SPETTRO ORIGINALE E DI QUELLO
%INTERPOLATO
function plotInterpolation (spectra1,spectra2,wavelength)
   
    plot(wavelength,spectra1,'b-')
    hold on
    plot(wavelength,spectra2,'r-')
    xlabel('Wavelength of the Orginal Spectra')
    xlabel('Wavelength of Interpolated Spectra (nm)')
    ylabel('% of Reflection (normalization)')
    legend('Master','Interpolated Master')
    
end
